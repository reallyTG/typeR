library(gsl)


### Name: Coulomb
### Title: Coulomb functions
### Aliases: Coulomb coulomb hydrogenicR_1 hydrogenicR coulomb_wave_FG
###   coulomb_wave_F_array coulomb_wave_FG_array coulomb_wave_FGp_array
###   coulomb_wave_sphF_array coulomb_CL coulomb_CL_array
### Keywords: array

### ** Examples


x <- seq(from=0,to=14,len=300)
jj <- coulomb_wave_FG(1,10,x,0)
plot(x,jj$val_F,type="l",xaxt="n",yaxt="n",bty="n",xlab="",ylab="",
       main="Figure 14.1, p539")
lines(x,jj$val_G,type="l",lty=2)
axis(1,pos=0,at=1:14,
       labels=c("","2","","4","","6","","8","","10","","12","","14"))
lines(c(0,1),c(0,0))
axis(2,pos=0)
text(9.5, 0.63, expression(F[L]))
text(8.5, 1.21, expression(G[L]))





x <- seq(from=0,to=24,len=400)
plot(x,coulomb_wave_FG(eta=1,x,L_F=0,k=0)$val_F,type="l",
     ylim=c(-1.3,1.7), xlim=c(0,26),
     xaxt="n",yaxt="n",bty="n",xlab="",ylab="",main="Figure 14.3, p541",lty=3)
lines(x,coulomb_wave_FG(eta= 0,x,L_F=0,k=0)$val_F,type="l",lty=1)
lines(x,coulomb_wave_FG(eta= 5,x,L_F=0,k=0)$val_F,type="l",lty=6)
lines(x,coulomb_wave_FG(eta=10,x,L_F=0,k=0)$val_F,type="l",lty=6)
lines(x,coulomb_wave_FG(eta=x/2,x,L_F=0,k=0)$val_F,type="l",lty="F3")
axis(1,pos=0,at=1:24,
       labels=c("","2","","4","","","","8","","10","","12",
                "","14","","","","18","","","","22","","24"))
lines(c(0,26),c(0,0))
axis(2,pos=0,at=0.2*(-6:9),
       labels=c("","-1.2","","-.8","","-.4","","0","",".4",
                "",".8","","1.2","","1.6"))
text(2.5, -0.8, expression(eta == 0))
text(4.5,1.1,adj=0, expression(eta == 1))
text(14,1.4,adj=0, expression(eta == 5))
text(22,1.4,adj=0, expression(eta == 10))






x <- seq(from=0.5,to=10,by=0.5)
jj <- coulomb_wave_FG(eta=t(matrix(x,20,5)), x=1:5,0,0)
jj.F <- t(jj$val_F)
jj.G <- t(jj$val_G)
colnames(jj.F) <- 1:5
colnames(jj.G) <- 1:5
cbind(x,jj.F)        #table 14.1, p 546, top bit.
cbind(x,jj.G)        #table 14.1, p 547, top bit.






