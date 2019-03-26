library(IQCC)


### Name: data.2
### Title: Hotelling Control Chart Phase II simulated data.
### Aliases: data.2

### ** Examples


mu <- c(5.682, 88.22)
Sigma <- symMatrix(c(3.770, -5.495, 13.53), 2)
datum <- data.1(20, 10, mu, Sigma)
# estat is the list with the values of the auxiliary statistics.
estat <- stats(datum, 20, 10, 2)
datum2 <- data.2(estat, 10, p = 2)




