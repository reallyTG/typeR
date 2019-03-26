library(semTools)


### Name: calculate.D2
### Title: Calculate the "D2" statistic
### Aliases: calculate.D2

### ** Examples

## generate a vector of chi-squared values, just for example
DF <- 3 # degrees of freedom
M <- 20 # number of imputations
CHI <- rchisq(M, DF)

## pool the "results"
calculate.D2(CHI, DF) # by default, an F statistic is returned
calculate.D2(CHI, DF, asymptotic = TRUE) # asymptotically chi-squared

## generate standard-normal values, for an example of Wald z tests
Z <- rnorm(M)
calculate.D2(Z) # default DF = 0 will square Z to make chisq(DF = 1)
## F test is equivalent to a t test with the denominator DF





