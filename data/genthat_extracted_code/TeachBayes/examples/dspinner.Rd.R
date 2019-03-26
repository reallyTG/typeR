library(TeachBayes)


### Name: dspinner
### Title: Computes likelihoods for spinner outcomes
### Aliases: dspinner

### ** Examples

  Prob <- matrix(c(.25, .25, .25, .25,
                   .50, .125, .125, .5,
                   .25, .5, .25, 0), 3, 4, byrow=TRUE)
  obs <- c(1, 2, 1, 3, 4)
  dspinner(obs, Prob)



