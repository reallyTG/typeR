library(nor1mix)


### Name: rnorMix
### Title: Generate 'Normal Mixture' Distributed Random Numbers
### Aliases: rnorMix
### Keywords: distribution

### ** Examples

x <- rnorMix(5000, MW.nm10)
hist(x)# you don't see the claw
plot(density(x), ylim = c(0,0.6),
     main = "Estim. and true 'MW.nm10' density")
lines(MW.nm10, col = "orange")



