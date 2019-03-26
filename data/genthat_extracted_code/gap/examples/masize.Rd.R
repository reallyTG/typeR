library(gap)


### Name: masize
### Title: Sample size calculation for mediation analysis
### Aliases: masize
### Keywords: misc

### ** Examples

## Not run: 
##D ## linear model
##D # CpCm
##D opts <- list(b2=0.5, rho=0.3, sdx2=1, sdy=1)
##D masize("linear1",opts)
##D # BpBm
##D opts <- list(b2=0.75, rho=0.3, f2=0.25, sdx2=sqrt(0.25*0.75), sdy=3)
##D masize("linear1",opts,gamma=0.1)
##D 
##D ## logistic model
##D # CpBm
##D opts <- list(p=0.25, b2=log(0.5), rho=0.5, sdx2=0.5)
##D masize("logistic1",opts)
##D opts <- list(p=0.25, b1=log(1.5), sdx1=1, b2=log(0.5), f2=0.5, rho=0.5, ns=10000,
##D              seed=1234)
##D masize("logistic4",opts)
##D opts <- list(p=0.25, b1=log(1.5), sdx1=1, b2=log(0.5), f2=0.5, rho=0.5, ns=10000,
##D              seed=1234)
##D masize("logistic4",opts)
##D opts <- list(p=0.25, b1=log(1.5), sdx1=4.5, b2=log(0.5), f2=0.5, rho=0.5, ns=50000,
##D              seed=1234)
##D masize("logistic4",opts)
##D 
##D ## Poisson model
##D # BpBm
##D opts <- list(m=0.5, b2=log(1.25), rho=0.3, sdx2=sqrt(0.25*0.75))
##D masize("poisson1",opts)
##D opts <- list(m=0.5, b1=log(1.4), f1=0.25, b2=log(1.25), f2=0.25, rho=0.3)
##D masize("poisson5",opts)
##D opts <- c(opts,ns=10000, seed=1234)
##D masize("poisson9",opts)
##D 
##D ## Cox model
##D # BpBm
##D opts <- list(b2=log(1.5), rho=0.45, f=0.2, sdx2=sqrt(0.25*0.75))
##D masize("cox1",opts)
##D opts <- list(b1=log(2), f1=0.5, b2=log(1.5), f2=0.25, rho=0.45, f=0.2, seed=1234)
##D masize("cox5",c(opts, ns=10000))
##D masize("cox5",c(opts, ns=50000))
## End(Not run)



