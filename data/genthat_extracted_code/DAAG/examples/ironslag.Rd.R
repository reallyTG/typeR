library(DAAG)


### Name: ironslag
### Title: Iron Content Measurements
### Aliases: ironslag
### Keywords: datasets

### ** Examples

iron.lm <- lm(chemical ~ magnetic, data = ironslag)
oldpar <- par(mfrow = c(2,2))
plot(iron.lm)
par(oldpar)



