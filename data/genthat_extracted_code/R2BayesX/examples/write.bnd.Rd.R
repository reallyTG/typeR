library(R2BayesX)


### Name: write.bnd
### Title: Saving Maps in Boundary Format
### Aliases: write.bnd
### Keywords: spatial

### ** Examples

data("FantasyBnd")
tfile <- tempfile()
write.bnd(FantasyBnd, file = tfile)
cat(readLines(tfile), sep = "\n")
unlink(tfile)



