library(desiR)


### Name: d.overall
### Title: Combine individual desirabilities
### Aliases: d.overall

### ** Examples

set.seed(1)
x1 <- rnorm(1000, mean=100, sd =5) # generate data
x2 <- rnorm(1000, mean=100, sd =5) 

d1 <- d.high(x1, cut1=90, cut2=110, scale=1)
d2 <- d.low(x2, cut1=90, cut2=110, scale=1)

D <- d.overall(d1, d2, weights=c(1, 0.5))
plot(rev(sort(D)), type="l")



