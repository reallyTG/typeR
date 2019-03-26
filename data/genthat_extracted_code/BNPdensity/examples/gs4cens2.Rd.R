library(BNPdensity)


### Name: gs4cens2
### Title: Resampling Ystar function in the case of censoring
### Aliases: gs4cens2
### Keywords: internal

### ** Examples

## The function is currently defined as
function (ystar, xleft, xright, censor_code, idx, distr.k, sigma.k, 
    distr.p0, mu.p0, sigma.p0) 
{
    r <- length(ystar)
    nstar <- as.numeric(table(idx))
    for (j in seq(r)) {
        id <- which(!is.na(match(idx, j)))
        xjleft <- xleft[id]
        xjright <- xright[id]
        xbar <- 0.5 * sum(xjleft + xjright, na.rm = T)/nstar[j]
        y2star <- rk(1, distr = distr.k, mu = xbar, sigma = sigma.k/sqrt(nstar[j]))
        f.ratio <- rfystarcens2(v = y2star, v2 = ystar[j], xleft = xjleft, 
            xright = xjright, censor_code = censor_code[id], 
            distr.k = distr.k, sigma.k = sigma.k, distr.p0 = distr.p0, 
            mu.p0 = mu.p0, sigma.p0 = sigma.p0)
        k.ratio <- dk(ystar[j], distr = distr.k, mu = xbar, sigma = sigma.k/sqrt(nstar[j]))/
        dk(y2star, 
            distr = distr.k, mu = xbar, sigma = sigma.k/sqrt(nstar[j]))
        if (!is.nan(f.ratio * k.ratio)) {
            q2 <- min(1, f.ratio * k.ratio)
            ystar[j] <- ifelse(runif(1) <= q2, y2star, ystar[j])
        }
    }
    return(ystar)
  }



