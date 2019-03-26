library(TSclust)


### Name: diss.CID
### Title: Complexity-Invariant Distance Measure For Time Series
### Aliases: diss.CID
### Keywords: ~kwd1 ~kwd2

### ** Examples

n = 100
x <- rnorm(n)  #generate sample series, white noise and a wiener process
y <- cumsum(rnorm(n))

diss.CID(x, y)

z <- rnorm(n)
w <- cumsum(rnorm(n))
series = rbind(x, y, z, w)
diss(series, "CID")





