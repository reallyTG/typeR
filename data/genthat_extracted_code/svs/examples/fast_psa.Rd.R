library(svs)


### Name: fast_psa
### Title: Probabilistic Latent Semantic Analysis
### Aliases: fast_plsa fast_plsi fast_psa fast_psi

### ** Examples

SndT_Fra <- read.table(system.file("extdata", "SndT_Fra.txt", package = "svs"),
   header = TRUE, sep = "\t", quote = "\"", encoding = "UTF-8")
psa.SndT_Fra <- fast_psa(SndT_Fra, k = 7)
psa.SndT_Fra



