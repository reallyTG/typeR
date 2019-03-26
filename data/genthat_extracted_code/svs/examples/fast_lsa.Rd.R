library(svs)


### Name: fast_lsa
### Title: Latent Semantic Analysis
### Aliases: fast_lsa fast_lsi

### ** Examples

SndT_Fra <- read.table(system.file("extdata", "SndT_Fra.txt", package = "svs"),
   header = TRUE, sep = "\t", quote = "\"", encoding = "UTF-8")
lsa.SndT_Fra <- fast_lsa(SndT_Fra)
lsa.SndT_Fra



