library(addreg)


### Name: addreg.smooth
### Title: Smooth Additive Regression for Discrete Data
### Aliases: addreg.smooth
### Keywords: regression smooth

### ** Examples

## Simple example
dat <- data.frame(x1 = c(3.2,3.3,3.4,7.9,3.8,0.7,2.0,5.4,8.4,3.0,1.8,5.6,5.5,9.0,8.2),
  x2 = c(1,0,0,1,0,1,0,0,0,0,1,0,1,1,0),
  n = c(6,7,5,9,10,7,9,6,6,7,7,8,6,8,10),
  y = c(2,1,2,6,3,1,2,2,4,4,1,2,5,7,7))
m1 <- addreg.smooth(cbind(y, n-y) ~ B(x1, knot.range = 1:3) + factor(x2), mono = 1,
  data = dat, family = binomial, trace = 1)
## No test: 
plot(m1, at = data.frame(x2 = 0:1))
points(dat$x1, dat$y / dat$n, col = rainbow(2)[dat$x2 + 1], pch = 20)
## End(No test)



