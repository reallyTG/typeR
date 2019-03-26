library(IQCC)


### Name: T2.1
### Title: Hotelling T2 Statistic for Phase I.
### Aliases: T2.1

### ** Examples


mu <- c(5.682, 88.22)
Sigma <- symMatrix(c(3.770, -5.495, 13.53), 2)
#Example with individual observations
datum <- data.1(50, 1, mu, Sigma)
estat <- stats(datum, 50, 1, 2) 
T2.1(estat, 50, 1)
#Example with sub group observations
datum <- data.1(20, 10, mu, Sigma)
estat <- stats(datum, 20, 10, 2) 
T2.1(estat, 20, 10)




