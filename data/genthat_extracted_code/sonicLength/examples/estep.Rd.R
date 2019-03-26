library(sonicLength)


### Name: Ey.given.x
### Title: E-Step for Abundance Estimation
### Aliases: Ey.given.x pr.y.given.x
### Keywords: models

### ** Examples


mat <- diag(10)
mat[ ,10 ] <- 1.0
phi1 <- prop.table( rep(1,10))
theta1 <- 1:10
Ey.given.x( mat, theta1, phi1 )
pr.mat <- pr.y.given.x( mat, theta1, phi1 )
## Estimate Seen plus Unseen sites
popsize.chao <- function(tab) sum(tab)+tab[1]*(tab[1]-1)/(2*(tab[2]+1))
## evaluate at expected counts
popsize.chao( rowSums(pr.mat) ) 
## average randomly sampled counts
cnt.samp <- function(x) sample( seq_along(x) , 1 ,pr=x )
mean(replicate(100,popsize.chao( table(apply(pr.mat,2, cnt.samp) ))))



