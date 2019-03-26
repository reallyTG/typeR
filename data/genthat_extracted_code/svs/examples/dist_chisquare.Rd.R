library(svs)


### Name: dist_chisquare
### Title: Compute Chi-square Distances
### Aliases: dist_chisq dist_chisquare

### ** Examples

SndT_Fra <- read.table(system.file("extdata", "SndT_Fra.txt", package = "svs"),
   header = TRUE, sep = "\t", quote = "\"", encoding = "UTF-8")
tab.SndT_Fra <- table(SndT_Fra)
dist_chisquare(tab.SndT_Fra)



