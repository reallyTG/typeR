library(mixtools)


### Name: regcr
### Title: Add a Confidence Region or Bayesian Credible Region for
###   Regression Lines to a Scatterplot
### Aliases: regcr
### Keywords: file

### ** Examples

## Nonparametric credible regions fit to NOdata. 

data(NOdata)
attach(NOdata)
set.seed(100)
beta <- matrix(c(1.3, -0.1, 0.6, 0.1), 2, 2)
sigma <- c(.02, .05)
MH.out <- regmixMH(Equivalence, NO, beta = beta, s = sigma, 
                   sampsize = 2500, omega = .0013)
attach(data.frame(MH.out$theta))
beta.c1 <- cbind(beta0.1[2400:2499], beta1.1[2400:2499])
beta.c2 <- cbind(beta0.2[2400:2499], beta1.2[2400:2499])
plot(NO, Equivalence)
regcr(beta.c1, x = NO, nonparametric = TRUE, plot = TRUE, 
      col = 2)
regcr(beta.c2, x = NO, nonparametric = TRUE, plot = TRUE, 
      col = 3)




