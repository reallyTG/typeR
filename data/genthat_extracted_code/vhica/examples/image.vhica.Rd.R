library(vhica)


### Name: image.vhica
### Title: Consistency matrix for a transposable element in the VHICA
###   analysis.
### Aliases: image.vhica
### Keywords: hplot regression tree

### ** Examples

file.cb <- system.file("extdata", "mini-cbias.txt", package="vhica")
file.div <- system.file("extdata", "mini-div.txt", package="vhica")
file.tree <- if(require("ape")) system.file("extdata", "phylo.nwk", package="vhica") else NULL
vc <- read.vhica(cb.filename=file.cb, div.filename=file.div)
plot(vc, "dere", "dana")
image(vc, "mellifera:6", treefile=file.tree, skip.void=TRUE)



