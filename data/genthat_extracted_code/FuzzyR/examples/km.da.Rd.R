library(FuzzyR)


### Name: km.da
### Title: km.da
### Aliases: km.da

### ** Examples

wr <- runif(100, 0, 1)
wl <- wr * runif(100, 0, 1)
f <- abs(runif(100, 0, 1))
f <- sort(f)
km.da(wl, wr, f)



