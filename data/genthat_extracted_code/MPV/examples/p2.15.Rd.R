library(MPV)


### Name: p2.15
### Title: Data Set for Problem 2-15
### Aliases: p2.15
### Keywords: datasets

### ** Examples

data(p2.15)
attach(p2.15)
plot(visc ~ temp, pch=16)
visc.lm <- lm(visc ~ temp)
plot(visc.lm, which=1)
detach(p2.15)



