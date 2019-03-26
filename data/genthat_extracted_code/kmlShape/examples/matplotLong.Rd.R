library(kmlShape)


### Name: matplotLong
### Title: ~ Function: matplotLong ~
### Aliases: matplotLong

### ** Examples

### Preparing data
g <- function(x)dnorm(x,3)+dnorm(x,7)+x/10
dn <- data.frame(id=rep(1:20,each=101),
    times=rep((0:100)/10,times=20),
    traj=rep(g((0:100)/10),20)+rep(runif(20),each=101)+rnorm(20*101,,0.1))

### matplotLong
matplotLong(dn)

### matplotLong with a legend
matplotLong(dn,col=2:3,pourcent=c(0.50,0.50))



