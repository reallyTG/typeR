library(svs)


### Name: fast_sca
### Title: Simple Correspondence Analysis
### Aliases: fast_sca

### ** Examples

SndT_Fra <- read.table(system.file("extdata", "SndT_Fra.txt", package = "svs"),
   header = TRUE, sep = "\t", quote = "\"", encoding = "UTF-8")
sca.SndT_Fra <- fast_sca(SndT_Fra)
sca.SndT_Fra



