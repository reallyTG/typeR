library(RHawkes)


### Name: mllRH2
### Title: Minus loglikelihood of a RHawkes model with Rosenblatt residuals
### Aliases: mllRH2
### Keywords: Rosenblatt residual goodness-of-fit point process

### ** Examples

tmp <- mllRH2(sort(runif(50,0,100)),100,c(1,2,2,0.05))
qqunif<-function(dat,...){
  dat<-sort(as.numeric(dat));
  n<-length(dat);
  pvec<-ppoints(n);
  plot(pvec,dat,xlab="Theoretical Quantiles",
       ylab="Sample Quantiles",main="Uniform Q-Q Plot",...)
}
par(mfrow=c(1,2))
qqunif(tmp$U)
acf(tmp$U)
ks.test(tmp$U,"punif")



