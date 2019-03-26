library(actuar)


### Name: GeneralizedPareto
### Title: The Generalized Pareto Distribution
### Aliases: GeneralizedPareto dgenpareto pgenpareto qgenpareto rgenpareto
###   mgenpareto levgenpareto
### Keywords: distribution

### ** Examples

exp(dgenpareto(3, 3, 4, 4, log = TRUE))
p <- (1:10)/10
pgenpareto(qgenpareto(p, 3, 3, 1), 3, 3, 1)
qgenpareto(.3, 3, 4, 4, lower.tail = FALSE)

## variance
mgenpareto(2, 3, 2, 1) - mgenpareto(1, 3, 2, 1)^2

## case with shape1 - order > 0
levgenpareto(10, 3, 3, scale = 1, order = 2)

## case with shape1 - order < 0
levgenpareto(10, 1.5, 3, scale = 1, order = 2)



