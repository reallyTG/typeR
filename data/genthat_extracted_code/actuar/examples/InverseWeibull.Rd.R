library(actuar)


### Name: InverseWeibull
### Title: The Inverse Weibull Distribution
### Aliases: InverseWeibull dinvweibull pinvweibull qinvweibull rinvweibull
###   minvweibull levinvweibull dlgompertz plgompertz qlgompertz rlgompertz
###   mlgompertz levlgompertz
### Keywords: distribution

### ** Examples

exp(dinvweibull(2, 3, 4, log = TRUE))
p <- (1:10)/10
pinvweibull(qinvweibull(p, 2, 3), 2, 3)
mlgompertz(-1, 3, 3)
levinvweibull(10, 2, 3, order = 1)



