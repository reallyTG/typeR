library(widals)


### Name: Hals.snow
### Title: Fit ALS
### Aliases: Hals.snow
### Keywords: ~kwd1 ~kwd2

### ** Examples


set.seed(9999)

library(SSsimple)

tau <- 280
n.all <- 35

Hs.all <- matrix(rnorm(n.all), nrow=n.all)
Ht <- matrix(rnorm(tau*2), nrow=tau)
Hst.ls.all <- list()
for(i in 1:tau) { Hst.ls.all[[i]] <- matrix(rnorm(n.all*3), nrow=n.all) }

Hst.combined <- list()
for(i in 1:tau) { 
    Hst.combined[[i]] <- cbind( Hs.all, matrix(Ht[i, ], nrow=n.all, 
    ncol=ncol(Ht), byrow=TRUE), Hst.ls.all[[i]] ) 
}

######## use SSsimple to simulate
sssim.obj <- SS.sim.tv( 0.999, Hst.combined, 0.1, diag(1, n.all), tau )



Z.all <- sssim.obj$Z
Z <- Z.all
n <- n.all

Hst.ls <- Hst.ls.all

Hs <- Hs.all

xrho <- 1/10
xreg <- 1/10
b.lag <- -1

GP.mx <- matrix(c(xrho, xreg), nrow=1)

Zcv <- Hals.snow(j=1, Z, Hs, Ht, Hst.ls, b.lag, GP.mx) 


test.rng <- 20:tau

errs.sq <- (Z - Zcv)^2
sqrt( mean(errs.sq[test.rng, ]) )


## The function is currently defined as
function (j, Z, Hs, Ht, Hst.ls, b.lag, GP.mx) 
{
    rho <- GP.mx[j, 1]
    reg <- GP.mx[j, 2]
    Z.hat <- H.als.b(Z = Z, Hs = Hs, Ht = Ht, Hst.ls = Hst.ls, 
        rho = rho, reg = reg, b.lag = b.lag, Hs0 = NULL, Ht0 = NULL, 
        Hst0.ls = NULL)$Z.hat
    return(Z.hat)
  }



