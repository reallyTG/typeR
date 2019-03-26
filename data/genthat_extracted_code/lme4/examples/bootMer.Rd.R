library(lme4)


### Name: bootMer
### Title: Model-based (Semi-)Parametric Bootstrap for Mixed Models
### Aliases: bootMer
### Keywords: htest models

### ** Examples

fm01ML <- lmer(Yield ~ 1|Batch, Dyestuff, REML = FALSE)
## see ?"profile-methods"
mySumm <- function(.) { s <- sigma(.)
    c(beta =getME(., "beta"), sigma = s, sig01 = unname(s * getME(., "theta"))) }
(t0 <- mySumm(fm01ML)) # just three parameters
## alternatively:
mySumm2 <- function(.) {
    c(beta=fixef(.),sigma=sigma(.), sig01=sqrt(unlist(VarCorr(.))))
}

set.seed(101)
## 3.8s (on a 5600 MIPS 64bit fast(year 2009) desktop "AMD Phenom(tm) II X4 925"):
system.time( boo01 <- bootMer(fm01ML, mySumm, nsim = 100) )

## to "look" at it
if (requireNamespace("boot")) {
    boo01
    ## note large estimated bias for sig01
    ## (~30% low, decreases _slightly_ for nsim = 1000)

    ## extract the bootstrapped values as a data frame ...
    head(as.data.frame(boo01))

    ## ------ Bootstrap-based confidence intervals ------------

    ## warnings about "Some ... intervals may be unstable" go away
    ##   for larger bootstrap samples, e.g. nsim=500

    ## intercept
    (bCI.1 <- boot::boot.ci(boo01, index=1, type=c("norm", "basic", "perc")))# beta

    ## Residual standard deviation - original scale:
    (bCI.2  <- boot::boot.ci(boo01, index=2, type=c("norm", "basic", "perc")))
    ## Residual SD - transform to log scale:
    (bCI.2L <- boot::boot.ci(boo01, index=2, type=c("norm", "basic", "perc"),
                       h = log, hdot = function(.) 1/., hinv = exp))

    ## Among-batch variance:
    (bCI.3 <- boot::boot.ci(boo01, index=3, type=c("norm", "basic", "perc"))) # sig01

    
    confint(boo01)
    confint(boo01,type="norm")
    confint(boo01,type="basic")

    ## Graphical examination:
    plot(boo01,index=3)

    ## Check stored values from a longer (1000-replicate) run:
    (load(system.file("testdata","boo01L.RData", package="lme4")))# "boo01L"
    plot(boo01L, index=3)
    mean(boo01L$t[,"sig01"]==0) ## note point mass at zero!
} ## if boot package available



