library(acid)


### Name: sd.GB2
### Title: Standard Deviation of the Generalised Beta Distribution of
###   Second Kind
### Aliases: sd.GB2

### ** Examples

a.test<- 4
b.test<- 20000
p.test<- 0.7
q.test<- 1
alpha.test<-1
GB2sample<-rGB2(10000,b.test,a.test,p.test,q.test)
sd.GB2(b.test,a.test,p.test,q.test)
sd(GB2sample)



