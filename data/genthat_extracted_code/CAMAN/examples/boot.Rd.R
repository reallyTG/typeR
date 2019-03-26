library(CAMAN)


### Name: CAMANboot
### Title: Parametric bootstrap
### Aliases: CAMANboot
### Keywords: datasets

### ** Examples

# Parametric bootstrap for bivariate normally distributed data
data(CT)
library(mvtnorm)
hom1<-c(3.142442)
hom2<-c(-1.842393)
p1<-c(1)
start1<-c(2.961984,3.226141)
start2<-c(-2.578836, -1.500823)
pvem<-c(0.317,0.683)
CAMANboot(obs1=logitTPR, obs2=logitTNR, var1=varlogitTPR, var2=varlogitTNR,
          lambda11=hom1, lambda12=hom2, prob1=p1, 
          lambda21=start1, lambda22=start2, prob2=pvem,rep=3,data=CT)



