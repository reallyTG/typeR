library(IQCC)


### Name: remove.data
### Title: Remove an undesirable observation.
### Aliases: remove.data

### ** Examples


mu <- c(5.682, 88.22)
Sigma <- symMatrix(c(3.770, -5.495, 13.53), 2)
datum <- data.1(20, 10, mu, Sigma)
# Removing the observatiob 13 from the data set "datum" and updating it:
datum <- remove.data(datum, 13)




