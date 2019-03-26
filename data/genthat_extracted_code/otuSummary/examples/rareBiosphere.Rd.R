library(otuSummary)


### Name: rareBiosphere
### Title: Summarize different subgroups in the rare biosphere
### Aliases: rareBiosphere
### Keywords: summarize

### ** Examples

data(otumothur)

example <- rareBiosphere(otutab = otumothur, siteInCol = TRUE, taxhead = "taxonomy",
    percent = FALSE, threshold = 1, cutRatio = 100, cutPERare = 5)
length(example)
names(example)
head(example[["summaryTable"]])
head(example[["CRT"]])

example2 <- rareBiosphere(otutab = otumothur[,-454], siteInCol = TRUE,
    taxhead = NULL, percent=FALSE, threshold = 1, cutRatio = 100, cutPERare = 5)
length(example2)
names(example2)



