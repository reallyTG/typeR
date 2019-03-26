library(simpleboot)


### Name: lm.simpleboot.methods
### Title: Methods for linear model bootstrap.
### Aliases: summary.lm.simpleboot print.summary.lm.simpleboot
###   fitted.lm.simpleboot
### Keywords: regression

### ** Examples

data(airquality)
attach(airquality)
lmodel <- lm(Ozone ~ Wind + Solar.R)
lboot <- lm.boot(lmodel, R = 300)
summary(lboot)



