## ------------------------------------------------------------------------
library(SobolSequence)
sobolSequence.dimMinMax()

## ------------------------------------------------------------------------
sobolSequence.dimF2MinMax(10)

## ------------------------------------------------------------------------
s <- 4
m <- 10
c <- 2^m
mat <- sobolSequence.points(dimR=s, dimF2=m, count=c)
mat[1,]

## ------------------------------------------------------------------------
s <- 4
m <- 10
c <- 2^m
mat <- sobolSequence.points(dimR=s, dimF2=m, count=c, digitalShift=TRUE)
mat[1,]

