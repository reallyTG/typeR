library(bpcp)


### Name: quantile.kmciLR
### Title: Quantiles or Medians from 'kmci' or 'kmciLR' objects.
### Aliases: quantile.kmciLR quantile.kmci median.kmciLR median.kmci
### Keywords: survival

### ** Examples

data(leuk)
## kmciTG creates kmci object
fitTG<-kmciTG(leuk$time,leuk$status)
quantile(fitTG)
## bpcp creates kmciLR object 
fitBP<-bpcp(leuk$time,leuk$status)
median(fitBP)



