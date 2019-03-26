library(bssn)


### Name: reliabilitybssn
### Title: Reliability Function for the Birnbaum-Saunders model based on
###   Skew-Normal distribution
### Aliases: reliabilitybssn Rebssn Fbssn
### Keywords: Birnbaum-Saunders Skew-Normal reliability function failure
###   rate hazard function

### ** Examples

## Let's compute some realiability functions for a Birnbaum-Saunders model based on
## Skew normal Distribution for different values of the shape parameter.

ti  <- seq(0,2,0.01)
f1  <- Rebssn(ti,0.75,1,1)
f2  <- Rebssn(ti,1,1,1)
f3  <- Rebssn(ti,1.5,1,1)
f4  <- Rebssn(ti,2,1,1)
den <- cbind(f1,f2,f3,f4)

matplot(ti,den,type="l", col=c("deepskyblue4","firebrick1","darkmagenta","aquamarine4"),
ylab="S(t)", xlab="t",lwd=2)
legend(1.5,1,c(expression(alpha==0.75), expression(alpha==1), expression(alpha==1.5),
expression(alpha==2)),col= c("deepskyblue4","firebrick1","darkmagenta","aquamarine4"),
lty=1:4,lwd=2,seg.len=2,cex=0.9,box.lty=0,bg=NULL)


## Let's compute some hazard functions for a Birnbaum Saunders model based on
## Skew normal Distribution for different values of the skewness parameter.

ti  <- seq(0,2,0.01)
f1  <- Fbssn(ti,0.5,1,-1)
f2  <- Fbssn(ti,0.5,1,-2)
f3  <- Fbssn(ti,0.5,1,-3)
f4  <- Fbssn(ti,0.5,1,-4)
den <- cbind(f1,f2,f3,f4)
matplot(ti,den,type = "l", col = c("deepskyblue4","firebrick1", "darkmagenta", "aquamarine4"),
ylab = "h(t)" , xlab="t",lwd=2)
legend(0.1,23, c(expression(lambda==-1), expression(lambda==-2), expression(lambda == -3),
expression(lambda == -4)), col = c("deepskyblue4", "firebrick1", "darkmagenta","aquamarine4"),
lty=1:4,lwd=2,seg.len=2,cex=0.9,box.lty=1,bg=NULL)




