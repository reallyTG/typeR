library(fpc)


### Name: simmatrix
### Title: Extracting intersections between clusters from fpc-object
### Aliases: simmatrix
### Keywords: utilities

### ** Examples

set.seed(190000)
data(tonedata)
# Note: If you do not use the installed package, replace this by
# tonedata <- read.table("(path/)tonedata.txt", header=TRUE)
attach(tonedata)
tonefix <- fixreg(stretchratio,tuned,mtf=1,ir=20)
simmatrix(tonefix)[sseg(2,3)]



