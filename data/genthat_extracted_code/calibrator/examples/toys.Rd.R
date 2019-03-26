library(calibrator)


### Name: toys
### Title: Toy datasets
### Aliases: D1.toy D2.toy d.toy phi.toy theta.toy t.vec.toy toys x.toy
###   x.toy2 x.vec y.toy z.toy V.toy X.dist.toy
### Keywords: datasets

### ** Examples

data(toys)
D1.toy
extractor.toy(D1.toy)

D2.fun(theta=theta.toy , D2=D2.toy)
D2.fun(theta=theta.toy,D2=D2.toy[1,,drop=FALSE])

library("emulator")
corr.matrix(D1.toy,scales=rep(1,5))
corr.matrix(D1.toy, pos.def.matrix=diag(5))




