library(otuSummary)


### Name: otuReport
### Title: Summarize the community structure and abundance with OTU table
### Aliases: otuReport
### Keywords: summarize

### ** Examples

# summary the otu table in qiime format

data(otuqiime)
summaryInfo <- otuReport(otutab = otuqiime, siteInCol = TRUE, taxhead = "taxonomy",
    platform = "qiime", pattern = ";", prefix = TRUE, percent  =FALSE, level = "class")
length(summaryInfo)
names(summaryInfo)
summaryInfo[[1]]

# summary otu table in mothur format

data(otumothur)
summaryInfo <- otuReport(otutab = otumothur, siteInCol = TRUE, taxhead = "taxonomy",
    platform = "qiime", pattern = ";", percent = FALSE, level = "phylum", collap = ";")
length(summaryInfo)
names(summaryInfo)
summaryInfo[[1]]
bplot(summaryInfo[["taxaFreqs"]])

# summary otu table of relative abundance

per <- subOTU(otutab = otuqiime, siteInCol = TRUE, taxhead = "taxonomy",
    percent = FALSE, choose = "all", outype = "Relabund", sort = TRUE)

summaryInfo <- otuReport(otutab = per, siteInCol = TRUE, taxhead = "taxonomy",
    platform = "qiime", pattern = ";", percent = TRUE, level = "class")

length(summaryInfo)
names(summaryInfo)



