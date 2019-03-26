library(widals)


### Name: unload.Hst.ls
### Title: Convert a Space-Time Covariate into Data
### Aliases: unload.Hst.ls
### Keywords: ~kwd1 ~kwd2

### ** Examples

	
###### here's an itty-bitty example

tau <- 7
n <- 5

Hst.ls <- list()
for(i in 1:tau) { Hst.ls[[i]] <- matrix(rnorm(n*4), nrow=n) }

Zh <- unload.Hst.ls(Hst.ls, 1, 0)


## The function is currently defined as
function (Hst.ls, which.col, rgr.lags) 
{
    n <- nrow(Hst.ls[[1]])
    tau <- length(Hst.ls)
    Z.out <- matrix(NA, tau, n)
    min.ndx <- max(1, -min(rgr.lags) + 1)
    max.ndx <- min(tau, tau - max(rgr.lags))
    for (i in min.ndx:max.ndx) {
        Z.out[i - rgr.lags, ] <- Hst.ls[[i]][, which.col]
    }
    return(Z.out)
  }



