library(Compositional)


### Name: MLE of distributions defined in the (0, 1) interval
### Title: MLE of distributions defined in the (0, 1) interval
### Aliases: beta.est ibeta.est logitnorm.est hsecant01.est
### Keywords: Beta distribution logistic normal distribution inflated beta
###   distribution hypersecant distribution for proportions maximum
###   likelihood estimation Newton-Raphson proportions

### ** Examples

x <- rbeta(1000, 1, 4)
beta.est(x)
ibeta.est(x)

x <- runif(1000)
hsecant01.est(x)
logitnorm.est(x)
ibeta.est(x)

x <- rbeta(1000, 2, 5)
x[sample(1:1000, 50)] <- 0
ibeta.est(x)







