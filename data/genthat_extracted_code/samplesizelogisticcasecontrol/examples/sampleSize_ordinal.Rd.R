library(samplesizelogisticcasecontrol)


### Name: sampleSize_ordinal
### Title: Sample size for an ordinal exposure
### Aliases: sampleSize_ordinal

### ** Examples

  prev  <- 0.01
  logOR <- 0.3

  # No confounders, Prob(X=1)=0.2
  sampleSize_ordinal(prev, logOR, probX=c(0.8, 0.2)) 

  # Generate data for a N(0,1) confounder and ordinal exposure with 3 levels
  data <- cbind(rnorm(1000), rbinom(1000, 2, 0.5))
  beta <- c(0.1, 0.2)
  sampleSize_ordinal(prev, beta, data=data) 

  # Define a function to generate random vectors for two confounders and an ordinal
  #   exposure with 5 levels
  f <- function(n) {cbind(rnorm(n), rbinom(n, 1, 0.5), rbinom(n, 4, 0.5))}
  beta <- c(0.2, 0.3, 0.25)
  sampleSize_ordinal(prev, beta, distF=f) 




