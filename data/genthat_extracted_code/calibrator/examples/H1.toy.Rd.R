library(calibrator)


### Name: H1.toy
### Title: Basis functions for D1 and D2
### Aliases: H1.toy H2.toy
### Keywords: array

### ** Examples

data(toys)
jj <- extractor.toy(D1.toy)
x.star.toy <- jj$x.star
t.vec.toy <- jj$t.vec

H1.toy(D1=D1.toy)
H1.toy(D1.toy[1,,drop=FALSE])
H1.toy(D1.fun(x.star.toy , theta.toy)[1,,drop=FALSE])
H1.toy(D1.fun(x.star=x.toy,t.vec=theta.toy))
H1.toy(D1.fun(x.star=x.star.toy[1,],t.vec=t.vec.toy[1,]))
H1.toy(D1.fun(x.star=x.star.toy[1,],t.vec=t.vec.toy[1:2,]))

H2.toy(D2.toy)
H2.toy(t(x.toy))



