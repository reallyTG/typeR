library(rvalues)


### Name: rvaluesMCMC
### Title: R-values from MCMC output.
### Aliases: rvaluesMCMC
### Keywords: htest

### ** Examples

data(MCMCtest)

### For the MCMC output in MCMC_test, the prior assumed for the effect sizes of 
### interest was a mixture of two t-distributions. The function qthetaTMix 
### computes the quantiles for this prior.

qthetaTMix <- function(p) {
    ### function to compute quantiles (for upper tail probabilities) for a 
    ###  mixture of two t-distributions
    mu <- c(.35,-.12)
    sig <- c(.2,.08)
    mix.prop <- c(.25,.75)

    ff <- function(x,pp) {
        prob_less <- 0
        for(k in 1:2) {
            prob_less <- prob_less + pt((x - mu[k])/sig[k],df=4,lower.tail=FALSE)*mix.prop[k] 
        }
        return(prob_less - pp)
    }

    nn <- length(p)
    ans <- numeric(nn)
    for(i in 1:nn) {
        ans[i] <- uniroot(ff,interval=c(-5,5),tol=1e-6,pp=p[i])$root
    }
    return(ans)
}

rvs <- rvaluesMCMC(MCMCtest, qtheta = qthetaTMix)



