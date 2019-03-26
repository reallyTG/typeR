library(IQCC)


### Name: data.1
### Title: Hotelling Control Chart Phase I simulated data.
### Aliases: data.1

### ** Examples


mu <- c(5.682, 88.22)
Sigma <- symMatrix(c(3.770, -5.495, 13.53), 2)
#Simulated data with individual observations
datum <- data.1(50, 1, mu, Sigma)
#Simulated data with sub-group observations
datum <- data.1(20, 10, mu, Sigma)




