library(bpcp)


### Name: StCI
### Title: Get survival and confidence interval at t from 'kmci', 'kmciLR',
###   or 'survfit' object
### Aliases: StCI StCI.default StCI.kmci StCI.kmciLR
### Keywords: htest survival nonparametric

### ** Examples

data(leuk)
## compare to table 1 of Thomas and Grunkmeier (1975)
StCI(kmciTG(leuk$time,leuk$status),c(10,20))



