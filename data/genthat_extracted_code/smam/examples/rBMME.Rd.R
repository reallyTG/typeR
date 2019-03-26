library(smam)


### Name: rBMME
### Title: Sampling from Brown Motion with Measurement Error
### Aliases: rBMME rBmme

### ** Examples

tgrid <- seq(0, 10, length = 1001)
## make it irregularly spaced
tgrid <- sort(sample(tgrid, 800))
dat <- rBMME(tgrid, 1, 1)
plot(dat[,1], dat[,2], xlab="t", ylab="X(t)", type="l")




