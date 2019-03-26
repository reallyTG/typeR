library(qrandom)


### Name: qrandomnorm
### Title: Normal distributed sample of true random numbers
### Aliases: qrandomnorm

### ** Examples

## No test: 
## request for 10 true standard normal distributed random numbers
randomNumbers <- qrandomnorm(n = 10)

## request for 10 true random numbers with mean 5 and standard deviation of 3
randomNumbers <- qrandomnorm(n = 10, mean = 5, sd = 3)

## request for 10 true random numbers with mean 8, standard deviation of 2 and using
## the polar-method by George Marsaglia to transform internally used uniformly data
## into a normal distribution
randomNumbers <- qrandomnorm(n = 10, mean = 8, sd = 2, method = "polar")

## calculate mean of randomNumbers
mean(randomNumbers)
## End(No test)



