library(actuar)


### Name: InversePareto
### Title: The Inverse Pareto Distribution
### Aliases: InversePareto dinvpareto pinvpareto qinvpareto rinvpareto
###   minvpareto levinvpareto
### Keywords: distribution

### ** Examples

exp(dinvpareto(2, 3, 4, log = TRUE))
p <- (1:10)/10
pinvpareto(qinvpareto(p, 2, 3), 2, 3)
minvpareto(0.5, 1, 2)



