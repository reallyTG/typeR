library(IQCC)


### Name: add.data
### Title: Updates the Hotelling Control Chart.
### Aliases: add.data

### ** Examples


mu <- c(5.682, 88.22)
Sigma <- symMatrix(c(3.770, -5.495, 13.53), 2)
datum <- data.1(20, 10, mu, Sigma)
estat <- stats(datum, 20, 10, 2)
datum2 <- data.2(estat, 10, p = 2)
T2II <- T2.2(datum2, estat, 10)
#Not showing the phase I data set.
cchart.T2.2(T2II, 20, 10, 1, 25, 2)
datum3 <- data.2(estat, 10, p = 2)
add.data(datum3, estat, T2II, 10, 2)
#Showing the phase I data set.
cchart.T2.2(T2II, 20, 10, 1, 25, 2, datum = datum)
datum3 <- data.2(estat, 10, p = 2)
add.data(datum3, estat, T2II, 10, 2, 20)

#Example with individual observations
datum <- data.1(50, 1, mu, Sigma)
estat <- stats(datum, 50, 1, 2)
datum2 <- data.2(estat, 1, p = 2)
T2II <- T2.2(datum2, estat, 1)
#Not showing the phase I data set.
cchart.T2.2(T2II, 50, 1, 1, 25, 2)
datum3 <- data.2(estat, 1, p = 2)
add.data(datum3, estat, T2II, 1, 2)
#Showing the phase I data set.
cchart.T2.2(T2II, 50, 1, 1, 25, 2, datum = datum)
datum3 <- data.2(estat, 1, p = 2)
add.data(datum3, estat, T2II, 1, 2, 50)




