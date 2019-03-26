## ---- echo=FALSE, cache=FALSE--------------------------------------------
library(knitr)
options(tikzMetricsDictionary="tikzDictionary")
opts_chunk$set(fig.width=6.5, fig.height=8, cache=FALSE, message=FALSE,
               dev='tikz', external=FALSE,
               out.width=6.5, out.height=8)
# Fixed issue with dev='tikz' in Windows
# by setting external=FALSE and a new plot hook, as here:
# https://github.com/yihui/tikzDevice/issues/60
knit_hooks$set(plot = function(x, options) {
  if ('tikz' %in% options$dev && !options$external) {
    hook_plot_tex(x, options)
  } else hook_plot_md(x, options)
})

## ------------------------------------------------------------------------
library(RankingProject)
data(TravelTime2011)
USdata <- TravelTime2011
head(USdata)

# Format estimates and SEs into strings with 2 digits past the decimal
USdata$Estimate.Print = formatC(USdata$Estimate.2dec,
                                format = 'f', digits = 2)
# For SEs, also drop the leading 0
USdata$SE.Print = substring(formatC(USdata$SE.2dec,
                                    format = 'f', digits = 2),
                            first = 2)

## ------------------------------------------------------------------------
# Set Colorado as the reference state
refAbbr <- "CO"
refRow  <- which(USdata$Abbreviation==refAbbr)

# Set up parameter lists for table function and figure function
tableParList <- with(USdata,
                     list(ranks = Rank, names = Abbreviation, 
                          est = Estimate.Print, se = SE.Print,
                          placeType = "State", tikzText = TRUE))
plotParList <- with(USdata,
                      list(est = Estimate.2dec, se = SE.2dec,
                           names = Abbreviation, refName = refAbbr,
                           confLevel = .90, tikzText = TRUE))

## ------------------------------------------------------------------------
# Shaded Columns plot
plotParList$plotType <- "columns"
# Specify where to position the "Reference State:" text,
# and adjust column widths from their defaults
tableParList = c(tableParList,
                 list(columnsPlotRefLine = .7, col2 = .55, col3 = .8))
RankPlotWithTable(tableParList = tableParList, plotParList = plotParList,
                  tableWidthProp = 2/7, tikzText = TRUE)

## ------------------------------------------------------------------------
# Reset defaults for future plots
tableParList[c("columnsPlotRefLine", "col2", "col3")] <- NULL

## ------------------------------------------------------------------------
# For all remaining figures,
# table will show full state names instead of abbreviations
tableParList$names <- USdata$State

# Individual CIs
plotParList$plotType <- "individual"
plotParList$cex <- 0.6
RankPlotWithTable(tableParList = tableParList, plotParList = plotParList,
                  tikzText = TRUE)

## ------------------------------------------------------------------------
# CIs for differences from ref
plotParList$plotType <- "difference"
RankPlotWithTable(tableParList = tableParList, plotParList = plotParList,
                  annotRefName = USdata$State[refRow],
                  annotRefRank = USdata$Rank[refRow],
                  tikzText = TRUE)

## ------------------------------------------------------------------------
# Comparison intervals
plotParList$plotType <- "comparison"
plotParList$thetaLine <- 1.5
RankPlotWithTable(tableParList = tableParList, plotParList = plotParList,
                  tikzText = TRUE)
plotParList$thetaLine <- NULL

## ------------------------------------------------------------------------
# Goldstein-Healy adjusted CIs
plotParList$plotType <- "individual"
plotParList$GH <- TRUE
RankPlotWithTable(tableParList = tableParList, plotParList = plotParList,
                  tikzText = TRUE)

## ------------------------------------------------------------------------
# Double-tiered GH plot:
# inner tiers are GH CIs,
# outer tiers are usual 90% CIs
plotParList$tiers <- 2
# Legend auto-positioning is poor with line breaks in legend text;
# we can improve it by controlling (X,Y) manually
plotParList$legendX <- 13
plotParList$legendY <- 52
RankPlotWithTable(tableParList = tableParList, plotParList = plotParList,
                  tikzText = TRUE)

## ------------------------------------------------------------------------
# Double-tiered GH + Bonferroni plot:
# inner tiers are usual 90% CIs,
# outer tiers are 50-way demi-Bonferroni-corrected GH CIs
plotParList$Bonferroni <- "demi"
RankPlotWithTable(tableParList = tableParList, plotParList = plotParList,
                  tikzText = TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  # Not run:
#  library(tikzDevice)
#  tikz("/path/to/my/file.tex", standAlone = TRUE, width = 6.5, height = 8)
#  RankPlotWithTable(tableParList = tableParList, plotParList = plotParList,
#                    tikzText = TRUE)
#  dev.off()
#  tools::texi2pdf("/path/to/my/file.tex")

