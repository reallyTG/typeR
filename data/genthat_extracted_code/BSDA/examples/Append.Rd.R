library(BSDA)


### Name: Append
### Title: Median costs of an appendectomy at 20 hospitals in North
###   Carolina
### Aliases: Append
### Keywords: datasets

### ** Examples


fee <- Append$fee
ll <- mean(fee) - 2*sd(fee)
ul <- mean(fee) + 2*sd(fee)
limits <-c(ll, ul)
limits
fee[fee < ll | fee > ul]




