library(SpeciesMix)


### Name: artificial.data
### Title: Create an artificial data set
### Aliases: artificial.data
### Keywords: misc

### ** Examples

## for bernoulli
theta <- matrix(c(-0.9,-0.6,0.5,1,-0.9,1,0.9,-0.9),4,2,byrow=TRUE)
dat <- data.frame(y=rep(1,100),x=runif(100,0,2.5))
dat1 <- artificial.data(y~1+x,dat,theta,20)
## for negbin
theta <- matrix(c(-0.9,-0.6,0.5,1,-0.9,1,0.9,-0.9),4,2,byrow=TRUE)
dat <- data.frame(y=rep(1,100),x=runif(100,0,2.5))
dat1 <- artificial.data(y~1+x,dat,theta,20,dist="negbin")



