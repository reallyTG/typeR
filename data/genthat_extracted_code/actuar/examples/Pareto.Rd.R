library(actuar)


### Name: Pareto
### Title: The Pareto Distribution
### Aliases: Pareto dpareto ppareto qpareto rpareto mpareto levpareto
###   pareto2 dpareto2 ppareto2 qpareto2 rpareto2 mpareto2 levpareto2
### Keywords: distribution

### ** Examples

exp(dpareto(2, 3, 4, log = TRUE))
p <- (1:10)/10
ppareto(qpareto(p, 2, 3), 2, 3)

## variance
mpareto(2, 4, 1) - mpareto(1, 4, 1)^2

## case with shape - order > 0
levpareto(10, 3, scale = 1, order = 2)

## case with shape - order < 0
levpareto(10, 1.5, scale = 1, order = 2)



