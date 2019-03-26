library(npsm)


### Name: gehan.test
### Title: Gehan generalization the Wilcoxon two-sample test
### Aliases: gehan.test
### Keywords: nonparametrics survival

### ** Examples

n<-76
y<-rexp(n)
event<-rbinom(n,1,0.7) # about 30%  censored
trt<-sample(c(0,1),n,replace=TRUE)
gehan.test(y,event,trt)



