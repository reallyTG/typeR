library(actuar)


### Name: SingleParameterPareto
### Title: The Single-parameter Pareto Distribution
### Aliases: SingleParameterPareto dpareto1 ppareto1 qpareto1 rpareto1
###   mpareto1 levpareto1
### Keywords: distribution

### ** Examples

exp(dpareto1(5, 3, 4, log = TRUE))
p <- (1:10)/10
ppareto1(qpareto1(p, 2, 3), 2, 3)
mpareto1(2, 3, 4) - mpareto(1, 3, 4) ^ 2
levpareto(10, 3, 4, order = 2)



