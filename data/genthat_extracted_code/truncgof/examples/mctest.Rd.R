library(truncgof)


### Name: mctest
### Title: Monte-Carlo simulation based GoF test
### Aliases: mctest
### Keywords: htest

### ** Examples

set.seed(123)
treshold <- 10
xc <- rgamma(100, 20, 2)    # complete sample
xt <- xc[xc > treshold]     # left truncated sample

## function for parameter fitting
estimate <- function(x, H){
    cgamma <- cdens("pgamma", H)
    ll <- function(p, y) {
        res <- -sum(do.call("cgamma", list(c(y), p[1], p[2], log = TRUE)))
        if (!is.finite(res)) return(-log(.Machine$double.xmin)*length(x))
        return(res)
    }
    est <- optim(c(1,1), ll, y = x, lower = c(.Machine$double.eps, 0), 
                 method = "L-BFGS-B")
    as.list(est$par)
}

fit <- estimate(xt, treshold)
cat("fitting parameters:", unlist(fit), "\n")

## calculate p-value with fitting algorithm defined in 'mctest' ...
ad2up.test(xt, "pgamma", fit, H = treshold,  estfun = NA, tol = 1e-02)

## ... or with the function 'estimate'
ad2up.test(xt, "pgamma", fit, H = treshold, estfun = "estimate(x, H)", 
           tol = 1e-02)      

## not run:
## if the 'evir' package is loaded:
## ad.test(xt, "pgpd", list(2,3), H = treshold,  
##         estfun = "as.list(gpd(x, 0)$par.ests)", tol = 1e-02)



