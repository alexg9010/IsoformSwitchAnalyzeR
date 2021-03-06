\name{extractSplicingSummary}
\alias{extractSplicingSummary}
\title{
Extracts alternative splicing summary
}
\description{
This functions function summarizes the individual alternative splicing events for each gene or switches and plots and/or returns a data.frame with the information. Please note this summarizes the overall number of splicing events - for looking into differences between the isoforms in a switch please use \link{extractSplicingEnrichment}.
}
\usage{
extractSplicingSummary(
    switchAnalyzeRlist,
    splicingToAnalyze = 'all',
    asFractionTotal = FALSE,
    alpha = 0.05,
    dIFcutoff = 0.1,
    onlySigIsoforms = FALSE,
    plot = TRUE,
    plotGenes = FALSE,
    localTheme = theme_bw(),
    returnResult = FALSE
)
}

\arguments{
  \item{switchAnalyzeRlist}{
A \code{switchAnalyzeRlist} object where \code{analyzeSwitchConsequences()} have been run to identify consequences of isoform switches
}
\item{splicingToAnalyze}{
A string indicating which consequences should be considered. See details for description. Default is all.
}
  \item{asFractionTotal}{
A logic indicating whether the consequences should be summarized calculated as numbers (if FALSE) or as a fraction of the total number of switches/genes (as indicated by \code{plotGenes}). Default is FALSE.
}
\item{alpha}{
The cutoff which the FDR correct p-values must be smaller than for calling significant switches. Default is 0.05.
}
\item{dIFcutoff}{
The cutoff which the changes in (absolute) isoform usage must be larger than before an isoform is considered switching. This cutoff can remove cases where isoforms with (very) low dIF values are deemed significant and thereby included in the downstream analysis. This cutoff is analogous to having a cutoff on log2 fold change in a normal differential expression analysis of genes to ensure the genes have a certain effect size. Default is 0.1 (10\%).
}
\item{onlySigIsoforms}{ A logic indicating whether to only consider significant isoforms, meaning only analyzing genes where at least two isoforms which both have significant usage changes in opposite direction (quite strict) Naturally this only works if the isoform switch test used have isoform resolution (which the build in \link{isoformSwitchTestDEXSeq} has). If FALSE all isoforms with an absolute dIF value larger than \code{dIFcutoff} in a gene with significant switches (defined by \code{alpha} and \code{dIFcutoff}) are included in the pairwise comparison. Default is FALSE (non significant isoforms are also considered based on the logic that if one isoform changes it contribution - there must be an equivalent opposite change in usage in the other isoforms from that gene).
}
  \item{plot}{
A logic indicting whether the summarized results should be plotted. If TRUE and \code{returnResult = FALSE} the ggplot2 object will be returned instead. Default is TRUE.
}
  \item{plotGenes}{
A logic indicating whether to plot the number/fraction of genes (if TRUE) or switches (if FALSE) with functional consequences should be plotted.
}
  \item{localTheme}{
General ggplo2 theme with which the plot is made, see \code{?ggplot2::theme} for more info. Default is theme_bw().
}
  \item{returnResult}{
A logic indicating whether the summarized results should be returned as a data.frame. If FALSE (and \code{plot=TRUE}) the ggplot2 object will be returned instead. Default is TRUE.
}
}

\details{
The classification of alternative splicing is always compared to the hypothetical pre-mRNA constructed by concatenating all exons from isoforms of the same gene. \cr


The alternative splicing types, which can be passed to \code{splicingToAnalyze} must be a combination of:
\itemize{
    \item \code{all} : All of the alternative splicing types indicated below.

    \item \code{IR} : Intron Retention.

    \item \code{A5} : Alternative 5' donor site (changes in the 5'end of the upstream exon).

    \item \code{A3} : Alternative 3' acceptor site (changes in the 3'end of the downstream exon).

    \item \code{ATSS} : Alternative Transcription Start Site.

    \item \code{ATTS} : Alternative Transcription Termination Site.

    \item \code{ES} : Exon Skipping.

    \item \code{MES} : Multiple Exon Skipping. Skipping of >1 consecutive exons.

    \item \code{MEE} : Mutually Exclusive Exons.

}

For details of how to interpret the splice events see the \code{details} section of \code{\link{analyzeAlternativeSplicing}}. \cr


}

\value{
If \code{returnResult=TRUE} a data.frame with the number (and fraction) of switches with specific consequences in each condition is returned. If \code{plot=TRUE} a plot summarizing the number (or fraction) of switches with specific consequences is created.
}

\references{
Vitting-Seerup et al. The Landscape of Isoform Switches in Human Cancers. Mol. Cancer Res. (2017).
}
\author{
Kristoffer Vitting-Seerup
}
\seealso{
\code{\link{analyzeAlternativeSplicing}}\cr
\code{\link{extractSplicingEnrichment}}\cr
\code{\link{extractSplicingEnrichmentComparison}}\cr
\code{\link{extractSplicingGenomeWide}}
}
\examples{
### Load example data
data("exampleSwitchListAnalyzed")

extractSplicingSummary( exampleSwitchListAnalyzed )
}
