library(IQCC)


### Name: cchart.T2.1
### Title: Phase I Hotelling Control Chart.
### Aliases: cchart.T2.1

### ** Examples


mu <- c(5.682, 88.22)
Sigma <- symMatrix(c(3.770, -5.495, 13.53), 2)
datum <- data.1(20, 10, mu, Sigma)
estat <- stats(datum, 20, 10, 2)
T2 <- T2.1(estat, 20, 10)
# estat is a list with the auxiliary statistics. T2 is a matrix with the values of the T2 statistic.
cchart.T2.1(T2, 20, 10, 2)




