library(AER)


### Name: NYSESW
### Title: Daily NYSE Composite Index
### Aliases: NYSESW
### Keywords: datasets

### ** Examples

## returns
data("NYSESW")
ret <- 100 * diff(log(NYSESW))
plot(ret)

## Stock and Watson (2007), p. 667, GARCH(1,1) model
library("tseries")
fm <- garch(coredata(ret))
summary(fm)



