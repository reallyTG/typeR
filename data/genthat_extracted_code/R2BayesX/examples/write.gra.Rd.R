library(R2BayesX)


### Name: write.gra
### Title: Saving Maps in Graph Format
### Aliases: write.gra
### Keywords: spatial

### ** Examples

data("FantasyBnd")
tfile <- tempfile()
write.gra(bnd2gra(FantasyBnd), file = tfile)
cat(readLines(tfile), sep = "\n")
unlink(tfile)



