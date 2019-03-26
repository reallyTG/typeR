library(asbio)


### Name: pairw.oneway
### Title: Welch tests controlled for simultaneous inference
### Aliases: pairw.oneway
### Keywords: univar htest

### ** Examples

y <- rnorm(30)
x <- as.factor(c(rep(1,10), rep(2,10), rep(3, 10)))
p <- pairw.oneway(y,x)
p
plot(p)



