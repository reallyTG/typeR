library(MuViCP)


### Name: ab.dist
### Title: Distance Functions for nearest neighbours
### Aliases: ab.dist ab.dist.matY eu.dist eu.dist.matY mh.dist mh.dist.matY

### ** Examples

x <- c(1,2)
y <- c(0,3)
mu <- c(1,3)
Sigma <- rbind(c(1,0.2),c(0.2,1))
Y <- MASS::mvrnorm(20, mu = mu, Sigma = Sigma)
ab.dist(x,y)
eu.dist(x,y)
mh.dist(x,y,Sigma)
ab.dist.matY(x,Y)
eu.dist.matY(x,Y)
mh.dist.matY(x,Y,Sigma)



