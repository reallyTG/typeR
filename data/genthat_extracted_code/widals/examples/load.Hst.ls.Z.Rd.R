library(widals)


### Name: load.Hst.ls.Z
### Title: Load Observations into Space-Time Covariates
### Aliases: load.Hst.ls.Z
### Keywords: ~kwd1 ~kwd2

### ** Examples


###### here's an itty-bitty example

tau <- 7
n <- 5

Z <- matrix(1, tau, n)

Hst.ls <- list()
for(i in 1:tau) { Hst.ls[[i]] <- matrix(rnorm(n*4), nrow=n) }

load.Hst.ls.Z(Z, Hst.ls.Z=Hst.ls, 1, 0)


########## insert into col 3

load.Hst.ls.Z(Z, Hst.ls.Z=Hst.ls, 3, 0)




############ lag Z examples

Z <- matrix(1:tau, tau, n)

######### lag -1 Z

load.Hst.ls.Z(Z, Hst.ls.Z=Hst.ls, 1, -1)

######### lag 0 Z -- default

load.Hst.ls.Z(Z, Hst.ls.Z=Hst.ls, 1, 0)

######### lag +1 Z

load.Hst.ls.Z(Z, Hst.ls.Z=Hst.ls, 1, +1)





## The function is currently defined as
function (Z, Hst.ls.Z, xwhich, rgr.lags = c(0)) 
{
    tau <- nrow(Z)
    min.ndx <- max(1, -min(rgr.lags) + 1)
    max.ndx <- min(tau, tau - max(rgr.lags))
    for (i in min.ndx:max.ndx) {
        Hst.ls.Z[[i]][, xwhich] <- t(Z[i + rgr.lags, ])
    }
    return(Hst.ls.Z)
  }



