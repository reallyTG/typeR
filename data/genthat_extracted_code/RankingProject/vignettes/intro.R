## ---- echo=FALSE, cache=FALSE--------------------------------------------
library(knitr)
opts_chunk$set(fig.width=6.5, fig.height=8, cache=FALSE, message=FALSE)

## ------------------------------------------------------------------------
library(RankingProject)
data(TravelTime2011)
USdata  <- TravelTime2011
head(USdata)

# Format estimates and SEs into strings with 2 digits past the decimal
USdata$Estimate.Print = formatC(USdata$Estimate.2dec,
                                format = 'f', digits = 2)
# For SEs, also drop the leading 0
USdata$SE.Print = substring(formatC(USdata$SE.2dec,
                                    format = 'f', digits = 2),
                            first = 2)

## ------------------------------------------------------------------------
# Set Colorado as the reference area
refAbbr <- "CO"
refRow  <- which(USdata$Abbreviation==refAbbr)

# Set up parameter lists for table function and plot function
tableParList <- with(USdata,
                     list(ranks = Rank, names = State, 
                          est = Estimate.Print, se = SE.Print,
                          placeType = "State"))
plotParList <- with(USdata,
                      list(est = Estimate.2dec, se = SE.2dec,
                           names = Abbreviation, refName = refAbbr,
                           confLevel = .90, cex = 0.6,
                           plotType = "individual"))

## ------------------------------------------------------------------------
# Individual CIs
RankPlotWithTable(tableParList = tableParList, plotParList = plotParList)

## ------------------------------------------------------------------------
# Shaded Columns plot
plotParList$plotType <- "columns"
# Specify where to position the "Reference State:" text,
# and adjust column widths from their defaults
tableParList <- c(tableParList,
                 list(columnsPlotRefLine = .7, col2 = .55, col3 = .8))
# Use abbreviations instead of full names in the table, to save space
tableParList$names <- USdata$Abbreviation
# Use default plotting character size
plotParList$cex <- NULL

# Actually draw the figure
RankPlotWithTable(tableParList = tableParList, plotParList = plotParList,
                  tableWidthProp = 2/7)

# Reset defaults for future plots
tableParList[c("columnsPlotRefLine", "col2", "col3")] <- NULL
# Use full state names in the table for future plots
tableParList$names <- USdata$State

## ------------------------------------------------------------------------
# Set smaller plot text and lower x-axis label for future plots
plotParList$cex <- 0.6
plotParList$thetaLine <- 1.5

# Goldstein-Healy adjusted CIs
plotParList$plotType <- "individual"
plotParList$GH <- TRUE
RankPlotWithTable(tableParList = tableParList, plotParList = plotParList)

## ------------------------------------------------------------------------
# Double-tiered GH plot:
# inner tiers are GH CIs,
# outer tiers are usual 90% CIs
plotParList$tiers <- 2
# Legend auto-positioning is poor with line breaks in legend text;
# we can improve it by controlling (X,Y) manually
plotParList$legendX <- 12
plotParList$legendY <- 53
RankPlotWithTable(tableParList = tableParList, plotParList = plotParList)

## ------------------------------------------------------------------------
# Double-tiered GH + Bonferroni plot:
# inner tiers are usual 90% CIs,
# outer tiers are 50-way demi-Bonferroni-corrected GH CIs
plotParList$Bonferroni <- "demi"
RankPlotWithTable(tableParList = tableParList, plotParList = plotParList)

## ------------------------------------------------------------------------
# Double-tiered GH + Bonferroni plot:
# inner tiers are usual 90% CIs,
# outer tiers are (51 choose 2)-way full-Bonferroni-corrected GH CIs
plotParList$Bonferroni <- "full"
RankPlotWithTable(tableParList = tableParList, plotParList = plotParList)
# Reset defaults for future plots
plotParList[c("Bonferroni", "GH", "tiers", "legendX", "legendY")] <- NULL

## ------------------------------------------------------------------------
# CIs for differences from reference state
plotParList$plotType <- "difference"
plotParList$lwdBold <- 2
RankPlotWithTable(tableParList = tableParList, plotParList = plotParList,
                  annotRefName = USdata$Rank[refRow],
                  annotRefRank = USdata$State[refRow])

## ------------------------------------------------------------------------
# Comparison intervals (Almond et al. 2000)
plotParList$plotType <- "comparison"
RankPlotWithTable(tableParList = tableParList, plotParList = plotParList)

