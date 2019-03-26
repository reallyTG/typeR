library(svs)


### Name: fast_lca
### Title: Latent Class Analysis
### Aliases: fast_lca

### ** Examples

SndT_Fra <- read.table(system.file("extdata", "SndT_Fra.txt", package = "svs"),
   header = TRUE, sep = "\t", quote = "\"", encoding = "UTF-8")
lca.SndT_Fra <- fast_lca(SndT_Fra, k = 7)
lca.SndT_Fra



