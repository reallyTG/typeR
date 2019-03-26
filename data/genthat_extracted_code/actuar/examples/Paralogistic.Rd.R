library(actuar)


### Name: Paralogistic
### Title: The Paralogistic Distribution
### Aliases: Paralogistic dparalogis pparalogis qparalogis rparalogis
###   mparalogis levparalogis
### Keywords: distribution

### ** Examples

exp(dparalogis(2, 3, 4, log = TRUE))
p <- (1:10)/10
pparalogis(qparalogis(p, 2, 3), 2, 3)

## variance
mparalogis(2, 2, 3) - mparalogis(1, 2, 3)^2

## case with shape - order/shape > 0
levparalogis(10, 2, 3, order = 2)

## case with shape - order/shape < 0
levparalogis(10, 1.25, 3, order = 2)



