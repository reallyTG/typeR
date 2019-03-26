library(actuar)


### Name: Burr
### Title: The Burr Distribution
### Aliases: Burr dburr pburr qburr rburr mburr levburr
### Keywords: distribution

### ** Examples

exp(dburr(1, 2, 3, log = TRUE))
p <- (1:10)/10
pburr(qburr(p, 2, 3, 2), 2, 3, 2)

## variance
mburr(2, 2, 3, 1) - mburr(1, 2, 3, 1) ^ 2

## case with shape1 - order/shape2 > 0
levburr(10, 2, 3, 1, order = 2)

## case with shape1 - order/shape2 < 0
levburr(10, 1.5, 0.5, 1, order = 2)



