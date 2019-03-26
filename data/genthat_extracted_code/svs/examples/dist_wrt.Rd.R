library(svs)


### Name: dist_wrt
### Title: Compute Distances with respect to a certain Point
### Aliases: dist_wrt

### ** Examples

SndT_Fra <- read.table(system.file("extdata", "SndT_Fra.txt", package = "svs"),
   header = TRUE, sep = "\t", quote = "\"", encoding = "UTF-8")
sca.SndT_Fra <- fast_sca(SndT_Fra)
dist_wrt(sca.SndT_Fra$pos1, wrt = "beginnen")



