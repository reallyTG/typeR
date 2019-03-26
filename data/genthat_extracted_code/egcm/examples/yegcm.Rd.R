library(egcm)


### Name: yegcm
### Title: Engle-Granger cointegration model from Yahoo! price series
### Aliases: yegcm
### Keywords: models ts

### ** Examples

## No test: 
e <- yegcm("SPY", "VOO", start="2013-01-01", end="2014-01-01")
print(e)
plot(e)
summary(e)
## End(No test)



