library(IDF)


### Name: TS.acc
### Title: Accumulation of a time series
### Aliases: TS.acc

### ** Examples

TS <- rgamma(n=1000,shape=1)
acc.2 <- TS.acc(TS,acc.val=2)
## No test: 
acc.24 <- TS.acc(TS,acc.val=24,moving.sum=TRUE)
## End(No test)



