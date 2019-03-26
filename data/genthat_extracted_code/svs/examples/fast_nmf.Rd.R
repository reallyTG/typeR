library(svs)


### Name: fast_nmf
### Title: Non-negative Matrix Factorization
### Aliases: fast_nmf fast_nmf_Al fast_nmf_Fr fast_nmf_KL

### ** Examples

SndT_Fra <- read.table(system.file("extdata", "SndT_Fra.txt", package = "svs"),
   header = TRUE, sep = "\t", quote = "\"", encoding = "UTF-8")
nmf.SndT_Fra <- fast_nmf(SndT_Fra, k = 7)
nmf.SndT_Fra



