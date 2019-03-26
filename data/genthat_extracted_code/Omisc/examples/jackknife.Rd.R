library(Omisc)


### Name: jackknife
### Title: jackknife
### Aliases: jackknife

### ** Examples

data<-cbind(1:10,1:10)
result<-jackknife(data)
lapply(result,mean)




