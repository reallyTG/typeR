library(bpcp)


### Name: summary.kmciLR
### Title: Summay method for 'kmci' or 'kmciLR' object.
### Aliases: summary.kmciLR summary.kmci
### Keywords: survival

### ** Examples

data(leuk)
## kmciTG creates kmci object
fitTG<-kmciTG(leuk$time,leuk$status)
summary(fitTG)
## bpcp creates kmciLR object 
fitBP<-bpcp(leuk$time,leuk$status)
summary(fitBP)



