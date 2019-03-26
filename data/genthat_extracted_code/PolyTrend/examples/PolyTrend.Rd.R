library(PolyTrend)


### Name: PolyTrend
### Title: Trend Classification Algorithm
### Aliases: PolyTrend
### Keywords: ts

### ** Examples


## Following examples are taken from Fig. 3 in Jamali et al. 2014
## Examples of a cubic trend (Site 1 & Site 2)
data(ex.a)
data(ex.b)

pt.a <- PolyTrend(ex.a, 0.05)
plot(pt.a, fig.dates = c(1982:2006))

pt.b <- PolyTrend(ex.b, 0.05)
plot(pt.b, fig.dates = c(1982:2006))

## Examples of a concealed trend with cubic form (Site 3 & Site 4)
data(ex.c)
data(ex.d)

pt.c <- PolyTrend(ex.c, 0.05)
plot(pt.c, fig.dates = c(1982:2006))

pt.d <- PolyTrend(ex.d, 0.05)
plot(pt.d, fig.dates = c(1982:2006))

## Examples of a quadratic trend (Site 5 & Site 6)
data(ex.e)
data(ex.f)

pt.e <- PolyTrend(ex.e, 0.05)
plot(pt.e, fig.dates = c(1982:2006))

pt.f <- PolyTrend(ex.f, 0.05)
plot(pt.f, fig.dates = c(1982:2006))

## Examples of a concealed trend with quadratic form (Site 7 & Site 8)
data(ex.g)
data(ex.h)

pt.g <- PolyTrend(ex.g, 0.05)
plot(pt.g, fig.dates = c(1982:2006))

pt.h <- PolyTrend(ex.h, 0.05)
plot(pt.h, fig.dates = c(1982:2006))

## Examples of a linear trend (Site 9 & Site 10)
data(ex.k)
data(ex.m)

pt.k <- PolyTrend(ex.k, 0.05)
plot(pt.k, fig.dates = c(1982:2006))

pt.m <- PolyTrend(ex.m, 0.05)
plot(pt.m, fig.dates = c(1982:2006))

## Example of a no-trend (Site 11)
data(ex.n)

pt.n <- PolyTrend(ex.n, 0.05)
plot(pt.n, fig.dates = c(1982:2006))







