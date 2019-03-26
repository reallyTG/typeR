library(ks)


### Name: mixt
### Title: Normal and t-mixture distributions
### Aliases: rnorm.mixt dnorm.mixt rmvnorm.mixt dmvnorm.mixt rmvt.mixt
###   dmvt.mixt mvnorm.mixt.mode
### Keywords: distribution

### ** Examples

## univariate normal mixture
x <- rnorm.mixt(1000, mus=c(-1,1), sigmas=c(0.5, 0.5), props=c(1/2, 1/2))

## bivariate mixtures 
mus <- rbind(c(-1,0), c(1, 2/sqrt(3)), c(1,-2/sqrt(3)))
Sigmas <- 1/25*rbind(invvech(c(9, 63/10, 49/4)), invvech(c(9,0,49/4)), invvech(c(9,0,49/4)))
props <- c(3,3,1)/7
dfs <- c(7,3,2)
x <- rmvnorm.mixt(1000, mus=mus, Sigmas=Sigmas, props=props)
y <- rmvt.mixt(1000, mus=mus, Sigmas=Sigmas, dfs=dfs, props=props)

mvnorm.mixt.mode(mus=mus, Sigmas=Sigmas, props=props)



