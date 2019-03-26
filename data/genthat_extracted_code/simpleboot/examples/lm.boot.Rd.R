library(simpleboot)


### Name: lm.boot
### Title: Linear model bootstrap.
### Aliases: lm.boot print.lm.simpleboot
### Keywords: regression

### ** Examples

data(airquality)
attach(airquality)
set.seed(30)
lmodel <- lm(Ozone ~ Wind)
lboot <- lm.boot(lmodel, R = 1000)
summary(lboot)

## With weighting
w <- runif(nrow(model.frame(lmodel)))
lbootw <- lm.boot(lmodel, R = 1000, weights = w)
summary(lbootw)

## Resample residuals
lboot2 <- lm.boot(lmodel, R = 1000, rows = FALSE)
summary(lboot2)



