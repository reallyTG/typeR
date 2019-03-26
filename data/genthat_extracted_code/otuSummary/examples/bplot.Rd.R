library(otuSummary)


### Name: bplot
### Title: Generate barplot with custom controls on the x axis labels
### Aliases: bplot
### Keywords: aplot

### ** Examples

data(otumothur)

summaryInfo <- otuReport(otutab = otumothur, siteInCol = TRUE, taxhead = "taxonomy",
    platform = "qiime", percent = FALSE, level = "phylum", collap = ";")

length(summaryInfo)
names(summaryInfo)
summaryInfo[[1]]

bplot(summaryInfo[["taxaFreqs"]])



