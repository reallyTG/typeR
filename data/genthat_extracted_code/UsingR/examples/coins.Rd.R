library(UsingR)


### Name: coins
### Title: The coins in my change bin
### Aliases: coins
### Keywords: datasets

### ** Examples

data(coins)
years = cut(coins$year,seq(1920,2010,by=10),include.lowest=TRUE,
  labels = paste(192:200,"*",sep=""))
table(years)



