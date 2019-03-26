library(PoweR)


### Name: powcomp.easy
### Title: Computation of power and level tables for hypothesis tests.
### Aliases: powcomp.easy
### Keywords: datagen htest

### ** Examples

# Warning: the order of the parameters of the law (4 maximum) is important!
sim1 <- c(n=100,law=2,stat=10,level=0.05,cL=NA,cR=0.35,alter=3,
          par1= 2.0,par2=NA,par3=NA,par4=NA,parstat1=NA,parstat2=NA)
sim2 <- c(n=100,law=2,stat=17,level=0.10,cL=-0.30,cR=NA,alter=1,
          par1=-1.0,par2=3.0,par3=NA,par4=NA,parstat1=NA,parstat2=NA)
sim3 <- c(n=100,law=2,stat=31,level=0.10,cL=NA,cR=0.50,alter=3,
          par1=-1.0,par2=3.0,par3=NA,par4=NA,parstat1=0.7,parstat2=NA)
sim4 <- c(n=100,law=7,stat=80,level=0.10,cL=NA,cR=9.319,alter=3,
          par1=NA,par2=NA,par3=NA,par4=NA,parstat1=1,parstat2=5)
params <- rbind(sim1,sim2,sim3,sim4)
powcomp.easy(params,M=10^2)
sim5 <- c(n=100,law=0,stat=80,level=0.10,cL=NA,cR=9.319,alter=3,
          par1=NA,par2=NA,par3=NA,par4=NA,parstat1=1,parstat2=5)
params <- rbind(params,sim5)
powcomp.easy(params,M=10^2,Rlaws=list(NULL,NULL,NULL,NULL,rnorm))



