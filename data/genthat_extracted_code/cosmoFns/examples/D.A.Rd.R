library(cosmoFns)


### Name: D.A
### Title: Angular diameter distance
### Aliases: D.A
### Keywords: misc

### ** Examples

D.A(2.3)

z <- seq(0.1, 5, 0.1)
d <- D.A(z)
plot(z, d/max(d), t='l', xlab='z', ylab='Normalized D.A')




