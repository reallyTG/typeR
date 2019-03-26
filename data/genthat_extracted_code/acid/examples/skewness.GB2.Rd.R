library(acid)


### Name: skewness.GB2
### Title: Skewness of the Generalised Beta Distribution of Second Kind
### Aliases: skewness.GB2

### ** Examples

a.test<- 4
b.test<- 20000
p.test<- 0.7
q.test<- 1
alpha.test<-1
GB2sample<-rGB2(10000,b.test,a.test,p.test,q.test)
skewness.GB2(b.test,a.test,p.test,q.test)
#require(e1071)
#skewness(GB2sample)#note that this estimation is highly unstable even for larger sample sizes.



