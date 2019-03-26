### R code from vignette source 'onionpaper.Rnw'

###################################################
### code chunk number 1: require_onion
###################################################



###################################################
### code chunk number 2: onionpaper.Rnw:148-149
###################################################
require(onion)


###################################################
### code chunk number 3: rquat5
###################################################
x <- rquat(5)
names(x) <- letters[1:5]
print(x)


###################################################
### code chunk number 4: add_ten
###################################################
k(x) <- j(x)+10
x


###################################################
### code chunk number 5: cxHk
###################################################
c(x,Hk)*x[1]


###################################################
### code chunk number 6: comm_user
###################################################
y <- rquat(5)
commutator(x,y)


###################################################
### code chunk number 7: associator_quat
###################################################
associator(x,y,rquat(5))


###################################################
### code chunk number 8: associator_oct
###################################################
associator(roct(3),roct(3),roct(3))


###################################################
### code chunk number 9: mod_of_sqrt
###################################################
x <- roct(3)
Mod(sqrt(x)*sqrt(x)-x)


###################################################
### code chunk number 10: use_log_quat
###################################################
x <- rquat(3)
y <- rquat(3)
Mod(log(x*x)-2*log(x))
Mod(log(x*y)-log(x)-log(y))


###################################################
### code chunk number 11: figplotter
###################################################
     data(bunny)
     par(mfrow=c(2,2))
     par(mai=rep(0.1,4))
     p3d(rotate(bunny,H1)   ,box=FALSE,d0=0.4,r=1e6,h=NULL,pch=16,cex=0.3,theta=0,phi=90,main="z=1 (identity)")
     p3d(rotate(bunny,Hi)   ,box=FALSE,d0=0.4,r=1e6,h=NULL,pch=16,cex=0.3,theta=0,phi=90,main="z=i")
     p3d(rotate(bunny,H1-Hj),box=FALSE,d0=0.4,r=1e6,h=NULL,pch=16,cex=0.3,theta=0,phi=90,main="z=1-i")
     p3d(rotate(bunny,Hall) ,box=FALSE,d0=0.4,r=1e6,h=NULL,pch=16,cex=0.3,theta=0,phi=90,main="z=1+i+j+k")


