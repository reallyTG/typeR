library(flexmix)


### Name: FLXMRrobglm
### Title: FlexMix Driver for Robust Estimation of Generalized Linear
###   Models
### Aliases: FLXMRrobglm FLXMRrobglm-class
### Keywords: models

### ** Examples

## Example from Compstat paper, see paper for detailed explanation:
data("NPreg", package = "flexmix")
DATA <- NPreg[, 1:2]
set.seed(3)
DATA2 <- rbind(DATA, cbind(x = -runif(3), yn = 50 + runif(3)))

## Estimation without (f2) and with (f3) background component
f2 <- flexmix(yn ~ x + I(x^2), data = DATA2, k = 2)
f3 <- flexmix(yn ~ x + I(x^2), data = DATA2, k = 3,
              model = FLXMRrobglm(), 
              control = list(minprior = 0))

## Predict on new data for plots
x <- seq(-5,15, by = .1)
y2 <- predict(f2, newdata = data.frame(x = x))
y3 <- predict(f3, newdata = data.frame(x = x))

## f2 was estimated without background component:
plot(yn ~ x, data = DATA2, pch = clusters(f2), col = clusters(f2))
lines(x, y2$Comp.1, col = 1)
lines(x, y2$Comp.2, col = 2)

## f3 is with background component:
plot(yn ~ x, data = DATA2, pch = 4 - clusters(f3),
     col = 4 - clusters(f3))
lines(x, y3$Comp.2, col = 2)
lines(x, y3$Comp.3, col = 1)



