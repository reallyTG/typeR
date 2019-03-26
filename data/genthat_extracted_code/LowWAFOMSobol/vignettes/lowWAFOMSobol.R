## ------------------------------------------------------------------------
library(LowWAFOMSobol)
lowWAFOMSobol.dimMinMax()

## ------------------------------------------------------------------------
lowWAFOMSobol.dimF2MinMax(10)

## ------------------------------------------------------------------------
s <- 4
m <- 10
mat <- lowWAFOMSobol.points(dimR=s, dimF2=m)
mat[1,]

## ------------------------------------------------------------------------
s <- 4
m <- 10
mat <- lowWAFOMSobol.points(dimR=s, dimF2=m, digitalShift=TRUE)
mat[1,]

