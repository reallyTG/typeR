library(extremefit)


### Name: plot.hill.adapt
### Title: Hill.adapt plot
### Aliases: plot.hill.adapt

### ** Examples


x <- abs(rcauchy(100))
HH <- hill.adapt(x, weights=rep(1, length(x)), initprop = 0.1,
               gridlen = 50 , r1 = 0.25, r2 = 0.05, CritVal=10)
plot(HH)





