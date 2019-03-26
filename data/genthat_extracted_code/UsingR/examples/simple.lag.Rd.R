library(UsingR)


### Name: simple.lag
### Title: applies function to moving subsets of a data vector
### Aliases: simple.lag
### Keywords: ts univar

### ** Examples

## find a moving average of the dow daily High
data(dowdata)
lag = 50; n = length(dowdata$High)
plot(simple.lag(dowdata$High,lag),type="l")
lines(dowdata$High[lag:n])



