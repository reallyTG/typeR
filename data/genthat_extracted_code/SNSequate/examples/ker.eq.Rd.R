library(SNSequate)


### Name: ker.eq
### Title: The Kernel method of test equating
### Aliases: ker.eq ker.eq.default
### Keywords: kernel equating

### ** Examples

#Kernel equating under the "EG" design
data(Math20EG)
mod<-ker.eq(scores=Math20EG,kert="gauss",hx=NULL,hy=NULL,degree=c(2,3),design="EG") 

summary(mod)

#Reproducing Table 7.6 in Von Davier et al, (2004)

scores<-0:20
SEEXy<-mod$SEEXy
SEEYx<-mod$SEEYx

Table7.6<-cbind(scores,SEEXy,SEEYx)
Table7.6

#Other nonstandard kernels. Table 10.3 in Von Davier (2011).

mod.logis<-ker.eq(scores=Math20EG,kert="logis",hx=NULL,hy=NULL,degree=c(2,3),design="EG") 
mod.unif<-ker.eq(scores=Math20EG,kert="unif",hx=NULL,hy=NULL,degree=c(2,3),design="EG") 
mod.gauss<-ker.eq(scores=Math20EG,kert="gauss",hx=NULL,hy=NULL,degree=c(2,3),design="EG") 

XtoY<-cbind(mod.logis$eqYx,mod.unif$eqYx,mod.gauss$eqYx)
YtoX<-cbind(mod.logis$eqXy,mod.unif$eqXy,mod.gauss$eqXy)

Table10.3<-cbind(XtoY,YtoX)
Table10.3

## Examples using Adaptive and Epanechnikov kernels
x_sim = c(1,2,3,4,5,6,7,8,9,10,11,10,9,8,7,6,5,4,3,2,1)
prob_sim = x_sim/sum(x_sim)
set.seed(1)
sim = rmultinom(1, p = prob_sim, size = 1000)

x_asimD = c(1,7,13,18,22,24,25,24,20,18,16,15,13,9,5,3,2.5,1.5,1.5,1,1)
probas_asimD = x_asimD/sum(x_asimD)
set.seed(1)
asim = rmultinom(1, p = probas_asimD, size = 1000)

scores = cbind(asim,sim)

mod.adap  = ker.eq(scores,degree=c(2,2),design="EG",kert="adap")
mod.epan  = ker.eq(scores,degree=c(2,2),design="EG",kert="epan")



