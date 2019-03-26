library(TeachBayes)


### Name: bayesian_crank
### Title: Computes Posterior Probabilities for Discrete Models
### Aliases: bayesian_crank

### ** Examples

  df <- data.frame(p=c(.1, .3, .5, .7, .9),
                   Prior=rep(1/5, 5))
  y <- 5
  n <- 10
  df$Likelihood <- dbinom(y, prob=df$p, size=n)
  df <- bayesian_crank(df)



