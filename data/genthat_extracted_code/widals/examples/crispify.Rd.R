library(widals)


### Name: crispify
### Title: Observation-Space Stochastic Correction
### Aliases: crispify
### Keywords: ~kwd1 ~kwd2

### ** Examples


######### here's an itty-bitty example

######### simulate itty-bitty data

tau <- 21 #### number of time points

d.alpha <- 2
R.scale <- 1
sigma2 <- 0.01
F <- 1
Q <- 0

n.all <- 14 ##### number of spacial locations

set.seed(9999)

library(SSsimple)

locs.all <- cbind(runif(n.all, -1, 1), runif(n.all, -1, 1)) #### random location of sensors
D.mx <- distance(locs.all, locs.all, FALSE) #### distance matrix

#### create measurement variance using distance and covariogram
R.all <- exp(-d.alpha*D.mx) + diag(sigma2, n.all)

Hs.all <- matrix(1, n.all, 1) #### constant mean function

##### use SSsimple to simulate system
xsssim <- SS.sim(F=F, H=Hs.all, Q=Q, R=R.all, length.out=tau, beta0=0)
Z.all <- xsssim$Z ###### system observation matrix


######## suppose use the global mean as a prediction

z.mean <- mean(Z.all)

Z.delta <- Z.all - z.mean


z.lags.vec <- rep(0, n.all)

geodesic <- FALSE
alpha <- 5
flatten <- 1

## emmulate cross-validation, i.e., 
## don't use observed site values to predict themselves (zero-based)
self.refs <- 0 
lags <- 0

locs1 <- cbind(locs.all, rep(0, n.all))
locs2 <- cbind(locs.all, rep(0, n.all))

Z.adj <- crispify(locs1, locs2, Z.delta, z.lags.vec, geodesic, alpha, 
    flatten, self.refs, lags, stnd.d = FALSE, log10cutoff = -16) 

Z.adj

Z.hat <- z.mean + Z.adj

sqrt( mean( (Z.all - Z.hat)^2 ) )


######### set flatten to zero -- this means no crispification

Z.adj <- crispify(locs1, locs2, Z.delta, z.lags.vec, geodesic, alpha, 
    flatten=0, self.refs, lags, stnd.d = FALSE, log10cutoff = -16) 

Z.adj

Z.hat <- z.mean + Z.adj

sqrt( mean( (Z.all - Z.hat)^2 ) )






## The function is currently defined as
function (locs1, locs2, Z.delta, z.lags.vec, geodesic, alpha, 
    flatten, self.refs, lags, stnd.d = FALSE, log10cutoff = -16) 
{
    n1 <- nrow(locs1)
    n2 <- nrow(locs2)
    tau <- nrow(Z.delta)
    n.Zd <- ncol(Z.delta)
    Z.out <- rep(0, tau * n1)
    z.rep.in <- rep(0:(n.Zd - 1), length.out = n2)
    t.start <- max(0, -min(lags))
    t.stop <- min(tau, tau - max(lags))
    t.s.s <- c(t.start, t.stop)
    if (geodesic) {
        rlocs1 <- pi * locs1[, 1:2]/180
        rlocs2 <- pi * locs2[, 1:2]/180
        Z.out <- .C("crispify", as.double(cos(rlocs1[, 1]) * 
            cos(rlocs1[, 2])), as.double(cos(rlocs1[, 1]) * sin(rlocs1[, 
            2])), as.double(sin(rlocs1[, 1])), as.double(locs1[, 
            3]), as.double(cos(rlocs2[, 1]) * cos(rlocs2[, 2])), 
            as.double(cos(rlocs2[, 1]) * sin(rlocs2[, 2])), as.double(sin(rlocs2[, 
                1])), as.double(locs2[, 3]), as.double(as.vector(Z.delta)), 
            as.double(Z.out), as.double(alpha), as.double(flatten), 
            as.integer(self.refs), as.integer(length(self.refs)), 
            as.integer(z.lags.vec), as.integer(z.rep.in), as.integer(n.Zd), 
            as.integer(n1), as.integer(n2), as.integer(tau), 
            as.integer(stnd.d), as.integer(t.s.s), as.integer(geodesic), 
            as.double(log10cutoff))[[10]]
    }
    else {
        Z.out <- .C("crispify", as.double(locs1[, 1]), as.double(locs1[, 
            2]), as.double(0), as.double(locs1[, 3]), as.double(locs2[, 
            1]), as.double(locs2[, 2]), as.double(0), as.double(locs2[, 
            3]), as.double(as.vector(Z.delta)), as.double(Z.out), 
            as.double(alpha), as.double(flatten), as.integer(self.refs), 
            as.integer(length(self.refs)), as.integer(z.lags.vec), 
            as.integer(z.rep.in), as.integer(n.Zd), as.integer(n1), 
            as.integer(n2), as.integer(tau), as.integer(stnd.d), 
            as.integer(t.s.s), as.integer(geodesic), as.double(log10cutoff))[[10]]
    }
    dim(Z.out) <- c(tau, n1)
    return(Z.out)
  }



