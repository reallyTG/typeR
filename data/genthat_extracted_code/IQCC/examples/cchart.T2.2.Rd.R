library(IQCC)


### Name: cchart.T2.2
### Title: Phase II Hotelling Control Chart.
### Aliases: cchart.T2.2

### ** Examples


mu <- c(5.682, 88.22)
Sigma <- symMatrix(c(3.770, -5.495, 13.53), 2)
datum <- data.1(20, 10, mu, Sigma)
estat <- stats(datum, 20, 10, 2)
datum2 <- data.2(estat, 10, p = 2)
T2II <- T2.2(datum2, estat, 10)
# For the first sample j = 1. T2II is a vector with the value of the firts T2 statistic.
cchart.T2.2(T2II, 20, 10, 1, 25, 2)
# Same of the above, but now showing the phase I data set.
cchart.T2.2(T2II, 20, 10, 1, 25, 2, datum = datum)

#Example with individual observations
datum <- data.1(50, 1, mu, Sigma)
estat <- stats(datum, 50, 1, 2)
datum2 <- data.2(estat, 1, p = 2)
T2II <- T2.2(datum2, estat, 1)
# For the first sample j = 1. T2II is a vector with the value of the firts T2 statistic.
cchart.T2.2(T2II, 50, 1, 1, 25, 2)
# Same of the above, but now showing the phase I data set.
cchart.T2.2(T2II, 50, 1, 1, 25, 2, datum = datum)





