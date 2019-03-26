library(UsingR)


### Name: dowdata
### Title: The Dow Jones average from Jan 1999 to October 2000
### Aliases: dowdata
### Keywords: datasets

### ** Examples

data(dowdata)
the.close <- dowdata$Close
n <- length(the.close)
plot(log(the.close[2:n]/the.close[1:(n-1)]))



