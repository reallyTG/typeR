library(otuSummary)


### Name: contrib
### Title: Contribution of rare/abundant biosphere to the total Bray-Curtis
###   dissimilarity
### Aliases: contrib
### Keywords: patition

### ** Examples

data(otuqiime)
result <- contrib(otutab = otuqiime, siteInCol = TRUE, taxhead = "taxonomy",
    threshold = 1, percent = FALSE, check = "abund", plot = FALSE)
names(result)
head(result)



