library(svs)


### Name: dist_cosine
### Title: Compute Cosine Distances
### Aliases: dist_cos dist_cosine

### ** Examples

SndT_Fra <- read.table(system.file("extdata", "SndT_Fra.txt", package = "svs"),
   header = TRUE, sep = "\t", quote = "\"", encoding = "UTF-8")
lsa.SndT_Fra <- fast_lsa(SndT_Fra)
dist_cosine(lsa.SndT_Fra$pos1[, 1:7])



