library(coxphf)


### Name: coxphfplot
### Title: Plot the Penalized Profile Likelhood Function
### Aliases: coxphfplot
### Keywords: survival

### ** Examples

time<-c(1,2,3)
cens<-c(1,1,1)
x<-c(1,1,0)
sim<-cbind(time,cens,x)
sim<-data.frame(sim)
profplot<-coxphfplot(sim, formula=Surv(time,cens)~x, profile=~x)



