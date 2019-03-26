library(otuSummary)


### Name: subOTU
### Title: Subset the OTU table
### Aliases: subOTU
### Keywords: subset

### ** Examples

data(otuqiime)

example1 <- subOTU(otutab = otuqiime, siteInCol = TRUE, taxhead ="taxonomy",
    percent = FALSE, choose = "abundant", threshold = 1, outype = "Relabund")
dim(example1)

example2 <- subOTU(otutab = otuqiime[,-454], siteInCol = TRUE, taxhead = NULL,
    percent = FALSE, choose = "rare", threshold = 1, outype = "counts")
dim(example2)



