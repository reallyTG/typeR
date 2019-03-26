library(widals)


### Name: widals.predict
### Title: WIDALS Interpolation
### Aliases: widals.predict
### Keywords: ~kwd1 ~kwd2

### ** Examples

	
#### similar to example provided in H.als.b.
	
set.seed(99999)

library(SSsimple)

tau <- 70
n.all <- 14

Hs.all <- matrix(rnorm(n.all), nrow=n.all)
Ht <- matrix(rnorm(tau*2), nrow=tau)
Hst.ls.all <- list()
for(i in 1:tau) { Hst.ls.all[[i]] <- matrix(rnorm(n.all*2), nrow=n.all) }

Hst.combined <- list()
for(i in 1:tau) { 
    Hst.combined[[i]] <- cbind( Hs.all, matrix(Ht[i, ], nrow=n.all, ncol=ncol(Ht), 
    byrow=TRUE), Hst.ls.all[[i]] ) 
}

locs.all <- cbind(runif(n.all, -1, 1), runif(n.all, -1, 1))
D.mx.all <- distance(locs.all, locs.all, FALSE)
R.all <- exp(-2*D.mx.all) + diag(0.01, n.all)

######## use SSsimple to simulate
sssim.obj <- SS.sim.tv( 0.999, Hst.combined, 0.01, R.all, tau )


ndx.support <- 1:10
ndx.interp <- 11:14

locs <- locs.all[ndx.support, ]
locs0 <- locs.all[ndx.interp, ]

Z.all <- sssim.obj$Z
Z <- Z.all[ , ndx.support]
Z0 <- Z.all[ , ndx.interp]

Hst.ls <- subsetsites.Hst.ls(Hst.ls.all, ndx.support)
Hst0.ls <- subsetsites.Hst.ls(Hst.ls.all, ndx.interp)

Hs <- Hs.all[ ndx.support, , drop=FALSE]
Hs0 <- Hs.all[ ndx.interp, , drop=FALSE]

test.rng <- 20:tau


################# use ALS
xrho <- 1/10
xreg <- 1/10
xALS <- H.als.b(Z=Z, Hs=Hs, Ht=Ht, Hst.ls=Hst.ls, rho=xrho, reg=xreg, 
b.lag=-1, Hs0=Hs0, Ht0=Ht, Hst0.ls=Hst0.ls) 

errs.sq <- (Z0 - xALS$Z0.hat)^2
sqrt( mean(errs.sq[test.rng, ]) )

################# now use WIDALS

GP <- c(1/10, 1/10, 2, 0, 1)
Zwid <- widals.predict(Z=Z, Hs=Hs, Ht=Ht, Hst.ls=Hst.ls, locs=locs, lags=c(0), 
b.lag=-1, Hs0=Hs0, Hst0.ls=Hst0.ls, locs0=locs0, FALSE, NULL, GP) 

errs.sq <- (Z0 - Zwid)^2
sqrt( mean(errs.sq[test.rng, ]) )



## The function is currently defined as
function (Z, Hs, Ht, Hst.ls, locs, lags, b.lag, Hs0, Hst0.ls, 
    locs0, geodesic = FALSE, wrap.around = NULL, GP, stnd.d = FALSE, 
    ltco = -16) 
{
    tau <- nrow(Z)
    n <- nrow(locs)
    k <- length(lags)
    n0 <- nrow(locs0)
    rho <- GP[1]
    reg <- GP[2]
    alpha <- GP[3]
    beta <- GP[4]
    flatten <- GP[5]
    locs0.3D <- cbind(locs0, rep(0, n0))
    locs.long.3D <- cbind(rep(locs[, 1], k), rep(locs[, 2], k), 
        beta * rep(lags, each = n))
    z.lags.vec <- rep(lags, each = n)
    ALS <- H.als.b(Z = Z, Hs = Hs, Ht = Ht, Hst.ls = Hst.ls, 
        rho = rho, reg = reg, b.lag = b.lag, Hs0 = Hs0, Ht0 = Ht, 
        Hst0.ls = Hst0.ls)
    Y.als <- ALS$Z.hat
    dim(Y.als)
    Y0.als <- ALS$Z0.hat
    dim(Y0.als)
    rm(ALS)
    Z.delta <- Z - Y.als
    Z.delta <- Z.clean.up(Z.delta)
    Z.adj <- crispify(locs1 = locs0.3D, locs2 = locs.long.3D, 
        Z.delta = Z.delta, z.lags.vec = z.lags.vec, geodesic = geodesic, 
        alpha = alpha, flatten = flatten, self.refs = c(-1), 
        lags = lags, stnd.d = stnd.d, log10cutoff = ltco)
    Z0.wid <- Y0.als + Z.adj
    return(Z0.wid)
  }



