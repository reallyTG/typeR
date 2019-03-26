library(valottery)


### Name: pick.3.1xday
### Title: Pick 3 (once daily)
### Aliases: pick.3.1xday
### Keywords: datasets

### ** Examples

lapply(pick.3.1xday[,-1],function(x)round(prop.table(table(x)),2))



