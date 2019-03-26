library(valottery)


### Name: cash.4.life
### Title: CASH4LIFE
### Aliases: cash.4.life
### Keywords: datasets

### ** Examples

## Check numbers drawn are uniformly distributed
x <- qunif(ppoints(nrow(cash.4.life)*5),1,60)
y <- sort(unlist(cash.4.life[,3:7]))
qqplot(x,y)



