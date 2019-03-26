library(valottery)


### Name: pick.4.1xday
### Title: Pick 4 (once daily)
### Aliases: pick.4.1xday
### Keywords: datasets

### ** Examples

## Any Pick 4 happen more than once?
results <- apply(pick.4.1xday[,-1],1,function(x)paste(x,collapse = ""))
any(table(results) > 1)
## Which numbers?
i <- which(table(results) > 1,useNames = FALSE)
sort(table(results)[i],decreasing = TRUE)



