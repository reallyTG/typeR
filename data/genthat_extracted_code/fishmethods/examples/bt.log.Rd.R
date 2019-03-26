library(fishmethods)


### Name: bt.log
### Title: Back-transformation of log-transformed mean and variance
### Aliases: bt.log
### Keywords: misc

### ** Examples

## The example below shows accuracy of the back-transformation
y<-rlnorm(100,meanlog=0.7,sdlog=0.2)
known<-unlist(list(known.mean=mean(y),var=var(y),sd=sd(y),
  var.mean=var(y)/length(y),sd.mean=sqrt(var(y)/length(y))))
est<-bt.log(meanlog=mean(log(y)),sdlog=sd(log(y)),n=length(y))[c(1,3,4,5,6)]
known;est


