library(cosmoFns)


### Name: dimmingFactor
### Title: Flux dimming factor
### Aliases: dimmingFactor
### Keywords: misc

### ** Examples

z <- seq(0.1, 5, 0.1)
df <- dimmingFactor(z)
plot(z, df/max(df), t='l', xlab='z', ylab='Normalized dimming factor')



