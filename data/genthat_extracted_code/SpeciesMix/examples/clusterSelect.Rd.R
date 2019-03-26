library(SpeciesMix)


### Name: clusterSelect
### Title: Fit SpeciesMix for a range of vaules for G
### Aliases: clusterSelect
### Keywords: misc

### ** Examples

G <-4
S <- 20
theta <- matrix(c(-0.9,-0.6,0.5,1,-0.9,1,0.9,-0.9),4,2,byrow=TRUE)
dat <- data.frame(y=rep(1,100),x=runif(100,0,2.5),z=rnorm(100,10,2))
dat1 <- artificial.data(y~1+x,dat,theta,S)
dat <- dat[,2:3]
clusters <- clusterSelect(obs~1+x,dat1$pa,dat,G=2:5,em.refit=2)



