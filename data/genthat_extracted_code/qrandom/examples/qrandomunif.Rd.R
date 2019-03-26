library(qrandom)


### Name: qrandomunif
### Title: Uniformly distributed sample of true random numbers
### Aliases: qrandomunif

### ** Examples

## No test: 
## request for 10 true standard uniformed random numbers
randomNumbers <- qrandomunif(n = 10)

## request for 10 true random numbers within the interval [-10; 10]
randomNumbers <- qrandomunif(n = 10, a = -10, b = 10)

## calculate mean of randomNumbers
mean(randomNumbers)
## End(No test)



