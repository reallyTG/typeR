library(POT)


### Name: ts2tsd
### Title: Mobile Window on a Time Series
### Aliases: ts2tsd
### Keywords: ts

### ** Examples

data(ardieres)
tsd <- ts2tsd(ardieres, 3 / 365)
plot(ardieres, type = "l", col = "blue")
lines(tsd, col = "green")



