library(acid)


### Name: entropy.GB2
### Title: Entropy Measures for a Generalised Beta Distribution of Second
###   Kind
### Aliases: entropy.GB2

### ** Examples

a.test<- 4
b.test<- 20000
p.test<- 0.7
q.test<- 1
alpha.test<-1
GB2sample<-rGB2(1000,b.test,a.test,p.test,q.test)
entropy.GB2(b.test,a.test,p.test,q.test,alpha=alpha.test,ylim=c(0,1e+07))
entropy(GB2sample, alpha.test)



