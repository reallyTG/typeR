library(simsem)


### Name: SimVector-class
### Title: Vector object: Random parameters vector
### Aliases: SimVector-class summaryShort,SimVector-method
###   summary,SimVector-method
### Keywords: classes

### ** Examples

showClass("SimVector")

factor.mean <- rep(NA, 2)
factor.mean.starting <- c(5, 2)
AL <- bind(factor.mean, factor.mean.starting)
rawDraw(AL)
summary(AL)
summaryShort(AL)



