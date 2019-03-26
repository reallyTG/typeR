library(MPV)


### Name: p2.16
### Title: Data Set for Problem 2-16
### Aliases: p2.16
### Keywords: datasets

### ** Examples

data(p2.16)
attach(p2.16)
plot(pressure ~ volume, pch=16)
pressure.lm <- lm(pressure ~ volume)
plot(pressure.lm, which=1)
summary(pressure.lm)
detach(p2.16)



