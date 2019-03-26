library(svs)


### Name: fast_mca
### Title: Multiple Correspondence Analysis
### Aliases: fast_mca

### ** Examples

SndT_Fra <- read.table(system.file("extdata", "SndT_Fra.txt", package = "svs"),
   header = TRUE, sep = "\t", quote = "\"", encoding = "UTF-8")
mca.SndT_Fra <- fast_mca(SndT_Fra)
mca.SndT_Fra



