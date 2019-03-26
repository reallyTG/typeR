library(svs)


### Name: fast_E_M
### Title: EM clustering
### Aliases: fast_EM fast_E_M

### ** Examples

SndT_Fra <- read.table(system.file("extdata", "SndT_Fra.txt", package = "svs"),
   header = TRUE, sep = "\t", quote = "\"", encoding = "UTF-8")
E_M.SndT_Fra <- fast_E_M(SndT_Fra, k = 7)
E_M.SndT_Fra



