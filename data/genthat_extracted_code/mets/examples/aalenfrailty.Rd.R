library(mets)


### Name: aalenfrailty
### Title: Aalen frailty model
### Aliases: aalenfrailty

### ** Examples

library("timereg")
dd <- simAalenFrailty(5000)
f <- ~1##+x
X <- model.matrix(f,dd) ## design matrix for non-parametric terms
system.time(out<-aalen(update(f,Surv(time,status)~.),dd,n.sim=0,robust=0))
dix <- which(dd$status==1)
t1 <- system.time(bb <- .Call("Bhat",as.integer(dd$status),
                              X,0.2,as.integer(dd$id),NULL,NULL,
                              PACKAGE="mets"))
spec <- 1
##plot(out,spec=spec)
## plot(dd$time[dix],bb$B2[,spec],col="red",type="s",
##      ylim=c(0,max(dd$time)*c(beta0,beta)[spec]))
## abline(a=0,b=c(beta0,beta)[spec])
##'

## Not run: 
##D thetas <- seq(0.1,2,length.out=10)
##D Us <- unlist(aalenfrailty(dd$time,dd$status,X,dd$id,as.list(thetas)))
##D ##plot(thetas,Us,type="l",ylim=c(-.5,1)); abline(h=0,lty=2); abline(v=theta,lty=2)
##D op <- aalenfrailty(dd$time,dd$status,X,dd$id)
##D op
## End(Not run)



