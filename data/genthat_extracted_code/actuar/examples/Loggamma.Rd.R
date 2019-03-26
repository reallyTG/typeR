library(actuar)


### Name: Loggamma
### Title: The Loggamma Distribution
### Aliases: Loggamma dlgamma plgamma qlgamma rlgamma mlgamma levlgamma
### Keywords: distribution

### ** Examples

exp(dlgamma(2, 3, 4, log = TRUE))
p <- (1:10)/10
plgamma(qlgamma(p, 2, 3), 2, 3)
mlgamma(2, 3, 4) - mlgamma(1, 3, 4)^2
levlgamma(10, 3, 4, order = 2)



