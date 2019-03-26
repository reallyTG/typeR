library(nlmixr)


### Name: dynmodel.mcmc
### Title: Fit a non-population dynamic model using mcmc
### Aliases: dynmodel.mcmc

### ** Examples

## Not run: 
##D 
##D ode <- "
##D    dose=200;
##D    pi = 3.1415926535897931;
##D 
##D    if (t<=0) {
##D       fI = 0;
##D    } else {
##D       fI = F*dose*sqrt(MIT/(2.0*pi*CVI2*t^3))*exp(-(t-MIT)^2/(2.0*CVI2*MIT*t));
##D    }
##D 
##D    C2 = centr/V2;
##D    C3 = peri/V3;
##D    d/dt(centr) = fI - CL*C2 - Q*C2 + Q*C3;
##D    d/dt(peri)  =              Q*C2 - Q*C3;
##D "
##D sys1 <- RxODE(model = ode)
##D 
##D 
##D ## ------------------------------------------------------------------------
##D dat <- read.table("invgaussian.txt", header=TRUE)
##D mod <- cp ~ C2 + prop(.1)
##D inits <- c(MIT=190, CVI2=.65, F=.92)
##D fixPars <- c(CL=.0793, V2=.64, Q=.292, V3=9.63)
##D ev <- eventTable()
##D ev$add.sampling(c(0, dat$time))
##D (fit <- dynmodel.mcmc(sys1, mod, ev, inits, dat, fixPars))
##D 
## End(Not run)



