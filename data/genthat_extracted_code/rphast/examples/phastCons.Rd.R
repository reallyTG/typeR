library(rphast)


### Name: phastCons
### Title: Produce conservation scores and identify conserved elements,
###   given a multiple alignment and a phylo-HMM.
### Aliases: phastCons
### Keywords: msa

### ** Examples

exampleArchive <- system.file("extdata", "examples.zip", package="rphast")
files <- c("ENr334-100k.fa", "rev.mod")
unzip(exampleArchive, files)
mod <- read.tm("rev.mod")
msa <- read.msa("ENr334-100k.fa")
rv <- phastCons(msa, mod)
names(rv)
rv2 <- phastCons(msa, mod, estimate.trees=TRUE)
names(rv2)
rv2$tree.models
unlink(files)



