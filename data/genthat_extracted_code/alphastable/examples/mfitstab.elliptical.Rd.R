library(alphastable)


### Name: mfitstab.elliptical
### Title: mfitstab.elliptical
### Aliases: mfitstab.elliptical

### ** Examples

# Here we follow for applying the EM algorithm to Z=(x1, x2)^T using the
# initial values alpha0=1, Sigma0=matrix(c(0.75,0.25,0.25,0.75),2,2), and
# Mu0=(0.5,0.5)^T.
library("stabledist")
x1<-urstab(100,1.2,0,1,2,0)
x2<-urstab(100,1.2,0,0.5,2,0)
z<-cbind(x1,x2)
## No test: 
mfitstab.elliptical(z,1,matrix(c(0.75,0.25,0.25,0.75),2,2),c(0.5,0.5))
## End(No test)



