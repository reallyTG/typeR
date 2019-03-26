library(kmlShape)


### Name: meanFrechet
### Title: ~ Function: meanFrechet ~
### Aliases: meanFrechet

### ** Examples

require(lattice)

### Define artificial data
g <- function(x)dnorm(0:20,runif(1,5,15),2)*rnorm(1,5,1)
dn <- data.frame(id=rep(1:20,each=21),
   times=rep((0:20),times=20),
   traj=as.numeric(sapply(1:20,g)),
   weight=1
)

xyplot(traj ~ times, data=dn, groups=id,type="l",ylim=c(0,1.4))
plot(meanFrechet(dn),ylim=c(0,1.4))
plot(meanFrechet(dn,0.001),ylim=c(0,1.4))
plot(meanFrechet(dn,10),ylim=c(0,1.4))



