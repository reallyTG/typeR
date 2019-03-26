library(tstools)


### Name: regularize
### Title: Turn an Irregular Time Series to a Regular, ts-Based Series
### Aliases: regularize

### ** Examples

ts1 <- rnorm(5)
dv <- c(seq(as.Date("2010-01-01"), length = 3, by="3 years"),
seq(as.Date("2018-01-01"), length = 2, by="2 years"))
library(zoo)
xx <- zoo(ts1,dv)
regularize(xx)

dv2 <- c(seq(as.Date("2010-01-01"), length = 20, by = "1 months"))
dv2 <- dv2[c(1:10, 14:20)]
xx2 <- zoo(rnorm(length(dv2)), dv2)
regularize(xx2)




