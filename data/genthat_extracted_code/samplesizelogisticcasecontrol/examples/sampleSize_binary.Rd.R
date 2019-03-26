library(samplesizelogisticcasecontrol)


### Name: sampleSize_binary
### Title: Sample size for a binary exposure
### Aliases: sampleSize_binary
### Keywords: traits

### ** Examples

  prev  <- 0.01
  logOR <- 0.3

  # No confounders, Prob(X=1)=0.2
  sampleSize_binary(prev, logOR, probXeq1=0.2) 

  # Generate data for a N(0,1) confounder and binary exposure
  data <- cbind(rnorm(1000), rbinom(1000, 1, 0.4))
  beta <- c(0.1, 0.2)
  sampleSize_binary(prev, beta, data=data) 

  # Define a function to generate random vectors for two confounders and the binary exposure
  f <- function(n) {cbind(rnorm(n), rbinom(n, 3, 0.5), rbinom(n, 1, 0.3))}
  logOR <- c(0.2, 0.3, 0.25)
  sampleSize_binary(prev, logOR, distF=f) 




