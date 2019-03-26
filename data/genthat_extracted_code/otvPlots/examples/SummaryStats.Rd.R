library(otvPlots)


### Name: SummaryStats
### Title: Create summary statistics for a numerical variable
### Aliases: SummaryStats

### ** Examples

data(bankData)
bankData <- PrepData(bankData, dateNm = "date", dateGp = "quarters", 
                    dateGpBp = "years")
mdx <- SummaryStats(myVar = "age", dataFl = bankData, 
                   dateGp = "quarters")$meltdx
plot(PlotQuantiles(mdx[variable %in% c("p99", "p50", "p1", "p99_g", "p50_g",
                   "p1_g")], "age", "quarters"))
plot(PlotMean(mdx[variable %in% c("mean", "cl1", "cl2")], "age", "quarters"))
plot(PlotRates(mdx, "age", "quarters"))



