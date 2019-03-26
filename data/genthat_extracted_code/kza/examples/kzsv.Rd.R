library(kza)


### Name: kzsv
### Title: Kolmogorov-Zurbenko Adaptive filter with Sample Variance.
### Aliases: kzsv summary.kzsv plot.kzsv
### Keywords: ts

### ** Examples

x <- c(rep(0,4000),rep(0.5,2000),rep(0,4000))
noise <- rnorm(n = 10000, sd = 1.0) # normally-distributed random variates
v <- x + noise
a<-kza(v, m=1000, k=3)
sv<-kzsv(a)



