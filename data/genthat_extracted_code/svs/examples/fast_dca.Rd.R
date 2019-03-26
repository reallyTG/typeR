library(svs)


### Name: fast_dca
### Title: Discriminant Correspondence Analysis
### Aliases: fast_dca

### ** Examples

SndT_Fra <- read.table(system.file("extdata", "SndT_Fra.txt", package = "svs"),
   header = TRUE, sep = "\t", quote = "\"", encoding = "UTF-8")
sca.SndT_Fra <- fast_sca(SndT_Fra)
kcl.SndT_Fra <- kmeans(sca.SndT_Fra$pos1, centers = 7)
dca.SndT_Fra <- fast_dca(SndT_Fra, clusters1 = kcl.SndT_Fra)
dca.SndT_Fra



