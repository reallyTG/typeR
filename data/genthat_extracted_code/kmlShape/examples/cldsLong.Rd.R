library(kmlShape)


### Name: cldsLong
### Title: ~ Function: cldsLong ~
### Aliases: cldsLong

### ** Examples


### Some artificial data
g <- function(x)dnorm(0:100,runif(1,25,75),10)*rnorm(1,5,1)
dn <- data.frame(id=rep(1:200,each=101),
   times=rep((0:100)/10,times=20),
   traj=as.numeric(sapply(1:200,g))
)

### clds format
myClds <- cldsLong(dn)
plotTraj(myClds)




