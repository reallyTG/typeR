library(svs)


### Name: pmi
### Title: Pointwise Mutual Information
### Aliases: PMI pmi

### ** Examples

SndT_Fra <- read.table(system.file("extdata", "SndT_Fra.txt", package = "svs"),
   header = TRUE, sep = "\t", quote = "\"", encoding = "UTF-8")
tab.SndT_Fra <- table(SndT_Fra)
pmi(tab.SndT_Fra)



