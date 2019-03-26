library(metaBMA)


### Name: inclusion
### Title: Inclusion Bayes Factor
### Aliases: inclusion

### ** Examples

#### Example with simple Normal-distribution models
# data:
x <- rnorm(50)

# Model 1: x ~ Normal(0,1)
logm1 <- sum(dnorm(x, log = TRUE))
# Model 2: x ~ Normal(1,1)
logm2 <-sum(dnorm(x, mean = 1, log = TRUE))
# Model 3: x ~ Student-t(df=2)
logm3 <-sum(dt(x, df=2, log = TRUE))

# BF: Correct (M1) vs. misspecified (M2, M3)
inclusion(c(logm1, logm2, logm3), include = 1)



