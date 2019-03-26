library(AdvBinomApps)


### Name: ci.mult.ref
### Title: Upper Clopper-Pearson confidence limits for area scaling with
###   differently sized reference products
### Aliases: ci.mult.ref
### Keywords: area scaling

### ** Examples

k<-c(1,2)
n<-c(110000,138000)
A.ref<-c(5.21,10.71)
A.follow<-8.5
p.target<-20e-06
ci.mult.ref(k,n,A.ref,A.follow,p.target=p.target)

k<-c(1,2,2)
n<-c(110000,138000,170000)
A.ref<-c(5.21,10.71,7.89)
A.follow<-8.5
p.target<-20e-06
ci.mult.ref(k,n,A.ref,A.follow,p.target=p.target)



