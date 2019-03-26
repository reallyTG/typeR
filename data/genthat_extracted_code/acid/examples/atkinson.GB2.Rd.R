library(acid)


### Name: atkinson.GB2
### Title: Atkinson Index for a Generalised Beta Distribution of Second
###   Kind
### Aliases: atkinson.GB2

### ** Examples

a.test<- 4
b.test<- 20000
p.test<- 0.7
q.test<- 1
epsilon.test<-1
GB2sample<-rGB2(1000,b.test,a.test,p.test,q.test)
atkinson.GB2(b.test,a.test,p.test,q.test,epsilon=epsilon.test,ylim=c(0,1e+07))
atkinson(GB2sample, epsilon.test)



