library(Omisc)


### Name: bias
### Title: Title
### Aliases: bias

### ** Examples

X<-data.frame(rnorm(1000))
theta<-mean(X)
boot<-NaiveBoot(X)
boot<-lapply(boot, mean)
boot<-do.call(rbind, boot)
bias(boot, theta)



