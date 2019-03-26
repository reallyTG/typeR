library(actuar)


### Name: InverseBurr
### Title: The Inverse Burr Distribution
### Aliases: InverseBurr dinvburr pinvburr qinvburr rinvburr minvburr
###   levinvburr
### Keywords: distribution

### ** Examples

exp(dinvburr(2, 2, 3, 1, log = TRUE))
p <- (1:10)/10
pinvburr(qinvburr(p, 2, 3, 1), 2, 3, 1)

## variance
minvburr(2, 2, 3, 1) - minvburr(1, 2, 3, 1) ^ 2

## case with 1 - order/shape2 > 0
levinvburr(10, 2, 3, 1, order = 2)

## case with 1 - order/shape2 < 0
levinvburr(10, 2, 1.5, 1, order = 2)



