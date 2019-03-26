library(widals)


### Name: load.Hst.ls.2Zs
### Title: Load Observations into Space-Time Covariates
### Aliases: load.Hst.ls.2Zs
### Keywords: ~kwd1 ~kwd2

### ** Examples


###### here's an itty-bitty example

tau <- 7
n <- 5

Z <- matrix(1, tau, n)

Z.na <- matrix(FALSE, tau, n)
Z.na[2:3, 4] <- TRUE

Z[Z.na] <- 2

Hst.ls <- list()
for(i in 1:tau) { Hst.ls[[i]] <- matrix(rnorm(n*4), nrow=n) }


load.Hst.ls.2Zs(Z, Z.na, Hst.ls.Z=Hst.ls, 1, 0)


########## insert into cols 3 and 4

load.Hst.ls.2Zs(Z, Z.na, Hst.ls.Z=Hst.ls, 2, 0)



## The function is currently defined as
function (Z, Z.na, Hst.ls.Z, xwhich, rgr.lags = c(0)) 
{
    tau <- nrow(Z)
    min.ndx <- max(1, -min(rgr.lags) + 1)
    max.ndx <- min(tau, tau - max(rgr.lags))
    for (i in min.ndx:max.ndx) {
        zi.na <- Z.na[i, ]
        Hst.ls.Z[[i]][!zi.na, 2 * xwhich - 1] <- Z[i + rgr.lags, 
            !zi.na]
        Hst.ls.Z[[i]][zi.na, 2 * xwhich - 1] <- 0
        Hst.ls.Z[[i]][zi.na, 2 * xwhich] <- Z[i + rgr.lags, zi.na]
        Hst.ls.Z[[i]][!zi.na, 2 * xwhich] <- 0
    }
    return(Hst.ls.Z)
  }



