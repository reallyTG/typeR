library(valottery)


### Name: cash.5.2xday
### Title: Cash 5 (twice daily)
### Aliases: cash.5.2xday
### Keywords: datasets

### ** Examples

max.days <- apply(subset(cash.5.2xday,time=="day",-(1:2)),1,max)
max.nights <- apply(subset(cash.5.2xday,time=="night",-(1:2)),1,max)
op <- par(mfrow=c(1,2))
hist(max.days)
hist(max.nights)
par(op)



