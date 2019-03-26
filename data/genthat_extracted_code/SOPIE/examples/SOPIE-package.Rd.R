library(SOPIE)


### Name: SOPIE-package
### Title: Package 'SOPIE' : Summary Information
### Aliases: SOPIE-package
### Keywords: package

### ** Examples

set.seed(777)
simdata<-von_mises_sim(n=5000,k=1,c=0.3,noise=0.2)
SOPIE(simdata,h=1,to=1,alpha=0.05,g=5,r=10,m=1,grid=100)




