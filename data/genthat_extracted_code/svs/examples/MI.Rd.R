library(svs)


### Name: MI
### Title: Mutual Information
### Aliases: MI mi

### ** Examples

SndT_Fra <- read.table(system.file("extdata", "SndT_Fra.txt", package = "svs"),
   header = TRUE, sep = "\t", quote = "\"", encoding = "UTF-8")
tab.SndT_Fra <- table(SndT_Fra)
MI(tab.SndT_Fra)



