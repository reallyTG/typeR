library(acid)


### Name: arithmean.GB2
### Title: Mean of the Generalised Beta Distribution of Second Kind
### Aliases: arithmean.GB2

### ** Examples

a.test<- 4
b.test<- 20000
p.test<- 0.7
q.test<- 1
alpha.test<-1
GB2sample<-rGB2(10000,b.test,a.test,p.test,q.test)
arithmean.GB2(b.test,a.test,p.test,q.test)
mean(GB2sample)



