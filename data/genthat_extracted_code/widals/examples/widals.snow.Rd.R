library(widals)


### Name: widals.snow
### Title: Fit WIDALS
### Aliases: widals.snow
### Keywords: ~kwd1 ~kwd2

### ** Examples

	
set.seed(99999)

library(SSsimple)

tau <- 100
n.all <- 35

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


n <- n.all
locs <- locs.all

Z.all <- sssim.obj$Z
Z <- Z.all


Hst.ls <- Hst.ls.all
Hs <- Hs.all

test.rng <- 20:tau

################  WIDALS, true cross-validation

rm.ndx <- create.rm.ndx.ls(n, 10)

cv <- 2
lags <- c(0)
b.lag <- 0

GP <- c(1/8, 1/12, 5, 0, 1)
GP.mx <- matrix(GP, ncol=length(GP))
Zwid <- widals.snow(j=1, rm.ndx, Z, Hs, Ht, Hst.ls, locs, lags, b.lag, cv = cv, 
geodesic = FALSE, wrap.around = NULL, GP.mx, stnd.d = FALSE, ltco = -16) 

errs.sq <- (Z - Zwid)^2
sqrt( mean(errs.sq[test.rng, ]) )


################  WIDALS, pseudo cross-validation

rm.ndx <- I(1:n)

cv <- -2
lags <- c(0)
b.lag <- -1

GP <- c(1/8, 1/12, 5, 0, 1)
GP.mx <- matrix(GP, ncol=length(GP))
Zwid <- widals.snow(j=1, rm.ndx, Z, Hs, Ht, Hst.ls, locs, lags, b.lag, cv = cv, 
geodesic = FALSE, wrap.around = NULL, GP.mx, stnd.d = FALSE, ltco = -16) 

errs.sq <- (Z - Zwid)^2
sqrt( mean(errs.sq[test.rng, ]) )





## The function is currently defined as
function (j, rm.ndx, Z, Hs, Ht, Hst.ls, locs, lags, b.lag, cv = 0, 
    geodesic = FALSE, wrap.around = NULL, GP.mx, stnd.d = FALSE, 
    ltco = -16) 
{
    tau <- nrow(Z)
    n <- ncol(Z)
    k <- length(lags)
    rho <- GP.mx[j, 1]
    reg <- GP.mx[j, 2]
    alpha <- GP.mx[j, 3]
    beta <- GP.mx[j, 4]
    flatten <- GP.mx[j, 5]
    locs.3D <- cbind(locs, rep(0, n))
    locs.long.3D <- cbind(rep(locs[, 1], k), rep(locs[, 2], k), 
        beta * rep(lags, each = n))
    z.lags.vec <- rep(lags, each = n)
    use.Hst.ls <- !is.null(Hst.ls)
    if (cv <= 0) {
        Y.als <- H.als.b(Z = Z, Hs = Hs, Ht = Ht, Hst.ls = Hst.ls, 
            rho = rho, reg = reg, b.lag = b.lag, Hs0 = NULL, 
            Ht0 = NULL, Hst0.ls = NULL)$Z.hat
        assign("Y.als", Y.als, pos = .GlobalEnv)
        Z.delta <- Z - Y.als
        Z.delta <- Z.clean.up(Z.delta)
        if (cv == -1) {
            self.refs <- (which(lags == 0) - 1) * n
        }
        if (cv == -2) {
            self.refs <- I(0:(k - 1)) * n
        }
        Z.adj <- crispify(locs1 = locs.3D, locs2 = locs.long.3D, 
            Z.delta = Z.delta, z.lags.vec = z.lags.vec, geodesic = geodesic, 
            alpha = alpha, flatten = flatten, self.refs = self.refs, 
            lags = lags, stnd.d = stnd.d, log10cutoff = ltco)
        Z.wid <- Y.als + Z.adj
    }
    if (cv == 1 | cv == 2) {
        Z.wid <- matrix(NA, tau, n)
        loc.0 <- which(lags == 0)
        for (kk in 1:length(rm.ndx)) {
            ii <- rm.ndx[[kk]]
            if (cv == 1) {
                drop.ndx <- (loc.0 - 1) * n + ii
            }
            else {
                drop.ndx <- (rep(1:k, each = length(ii)) - 1) * 
                  n + ii
            }
            if (use.Hst.ls) {
                red.Hst.ls <- list()
                for (i in 1:tau) {
                  red.Hst.ls[[i]] <- Hst.ls[[i]][-ii, , drop = FALSE]
                }
            }
            else {
                red.Hst.ls <- NULL
            }
            Y.als <- H.als.b(Z = Z[, -ii, drop = FALSE], Hs = Hs[-ii, 
                , drop = FALSE], Ht = Ht, Hst.ls = red.Hst.ls, 
                rho = rho, reg = reg, b.lag = b.lag, Hs0 = Hs, 
                Ht0 = Ht, Hst0.ls = Hst.ls)$Z0.hat
            Z.delta.drop <- Z[, -ii, drop = FALSE] - Y.als[, 
                -ii, drop = FALSE]
            Z.delta.drop <- Z.clean.up(Z.delta.drop)
            z.lags.vec.drop <- z.lags.vec[-drop.ndx]
            Z.adj <- crispify(locs1 = locs.3D[ii, , drop = FALSE], 
                locs2 = locs.long.3D[-drop.ndx, , drop = FALSE], 
                Z.delta = Z.delta.drop, z.lags.vec = z.lags.vec.drop, 
                geodesic = geodesic, alpha = alpha, flatten = flatten, 
                self.refs = c(-1), lags = lags, stnd.d = stnd.d, 
                log10cutoff = ltco)
            Z.wid[, ii] <- Y.als[, ii] + Z.adj
        }
    }
    return(Z.wid)
  }



