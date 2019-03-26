library(GB2)


### Name: MLprofGB2
### Title: Maximum Likelihood Estimation of the GB2 Based on the Profile
###   Log-likelihood
### Aliases: MLprofGB2 profml.gb2
### Keywords: distribution

### ** Examples

library(laeken)
data(eusilc)

# Income
inc <- as.vector(eusilc$eqIncome)

# Weights
w <- eusilc$rb050

# Data set
d <- data.frame(inc,w)
d <- d[!is.na(d$inc),]
   
# Truncate at 0
inc <- d$inc[d$inc > 0]
w   <- d$w[d$inc > 0]

# Fit using the profile log-likelihood
fitp <- profml.gb2(inc, w)$opt1

# Fitted GB2 parameters
ap <- fitp$par[1]
bp <- fitp$par[2]
pp <- prof.gb2(inc, ap, bp, w)[3]
qp <- prof.gb2(inc, ap, bp, w)[4]

# Profile log-likelihood
proflik <- fitp$value

# If we want to compare the indicators
## Not run: 
##D # GB2 indicators
##D indicp <- round(main.gb2(0.6,ap,bp,pp,qp), digits=3)
##D # Empirical indicators
##D indice <- round(main.emp(inc,w), digits=3)
## End(Not run)

# Plots
## Not run: plotsML.gb2(inc,ap,bp,pp,qp,w)



