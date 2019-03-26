library(SNSequate)


### Name: SEED
### Title: Standard error of equating difference
### Aliases: SEED SEED.default
### Keywords: kernel equating

### ** Examples

#Example: Figure7.7 in Von Davier et al, (2004)
data(Math20EG)

mod.gauss<-ker.eq(scores=Math20EG,kert="gauss", hx = NULL, hy = NULL,degree=c(2, 3),design="EG")
mod.linear<-ker.eq(scores=Math20EG,kert="gauss", hx = 20, hy = 20,degree=c(2, 3),design="EG")

Rx<-mod.gauss$eqYx-mod.linear$eqYx
seed<-SEED(mod.gauss,mod.linear)$SEEDYx

plot(0:20,Rx,ylim=c(-0.8,0.8),pch=15)
abline(h=0)
points(0:20,2*seed,pch=0)
points(0:20,-2*seed,pch=0)

#Example Figure 10.4 in Von Davier (2011)
mod.unif<-ker.eq(scores=Math20EG,kert="unif", hx = NULL, hy = NULL,degree=c(2, 3),design="EG")
mod.logis<-ker.eq(scores=Math20EG,kert="logis", hx = NULL, hy = NULL,degree=c(2, 3),design="EG")

Rx1<-mod.logis$eqYx-mod.gauss$eqYx
Rx2<-mod.unif$eqYx-mod.gauss$eqYx

seed1<-SEED(mod.logis,mod.gauss)$SEEDYx
seed2<-SEED(mod.unif,mod.gauss)$SEEDYx

plot(0:20,Rx1,ylim=c(-0.2,0.2),pch=15,main="LK vs GK",ylab="",xlab="Scores")
abline(h=0)
points(0:20,2*seed1,pch=0)
points(0:20,-2*seed1,pch=0)

plot(0:20,Rx2,ylim=c(-0.2,0.2),pch=15,main="UK vs GK",ylab="",xlab="Scores")
abline(h=0)
points(0:20,2*seed2,pch=0)
points(0:20,-2*seed2,pch=0)




