library(MED)


### Name: summary.MED
### Title: Summarizing output of study.
### Aliases: summary.MED print.summary.MED

### ** Examples

library(MED)
#binary treatment and binary mediator

set.seed(25)
n <- 200
Z <- matrix(rnorm(4*n),ncol=4,nrow=n)
prop.e <- 1 / (1 + exp(Z[,1] - 0.5 * Z[,2] + 0.25*Z[,3] + 0.1 * Z[,4]))
treat <- rbinom(n, 1, prop.e)
prop.m <- 1 / (1 + exp(-(0.5 - Z[,1] + 0.5 * Z[,2] - 0.9 *Z [,3] + Z[,4] - 1.5 * treat)))
M <- rbinom(n, 1, prop.m)
Y <- 200 + treat + M + 27.4*Z[,1] + 13.7*Z[,2] +
          13.7*Z[,3] + 13.7*Z[,4] + rnorm(n)
X <- cbind(exp(Z[,1])/2,Z[,2]/(1+exp(Z[,1])),
          (Z[,1]*Z[,3]/25+0.6)^3,(Z[,2]+Z[,4]+20)^2)

#estimation of natural mediation effecs
fit1<-MED(Y,treat,M,X)
summary(fit1)




