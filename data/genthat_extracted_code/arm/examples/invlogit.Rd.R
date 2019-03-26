library(arm)


### Name: invlogit
### Title: Logistic and Inverse logistic functions
### Aliases: invlogit logit
### Keywords: models

### ** Examples

 data(frisk)
 n <- 100
 x1 <- rnorm (n)
 x2 <- rbinom (n, 1, .5)
 b0 <- 1
 b1 <- 1.5
 b2 <- 2
 Inv.logit <- invlogit(b0+b1*x1+b2*x2)
 plot(b0+b1*x1+b2*x2, Inv.logit)



