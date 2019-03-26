library(someKfwer)


### Name: someKFWER-package
### Title: Controlling the k-FWER (Generalized Familywise Error Rate)
### Aliases: someKfwer-package
### Keywords: package htest

### ** Examples

set.seed(13)
y=matrix(rnorm(3000),3,1000)+2                      #create toy data
p=apply(y,2,function(y) t.test(y)$p.value)          #compute p-values
M2=apply(y^2,2,mean)                                #compute ordering criterion

kord=kfweOrd(p,k=5,ord=M2)                          #ordinal procedure
kgr=kfweGR(p,k=5)                                   #Guo and Romano

kord=kfweOrd(p,k=5,ord=M2,GD=TRUE)                  #ordinal procedure (any dependence)
klr=kfweLR(p,k=5)                                   #Lehaman and Romano (any dependence)



