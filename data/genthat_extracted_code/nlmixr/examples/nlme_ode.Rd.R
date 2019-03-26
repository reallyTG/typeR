library(nlmixr)


### Name: nlme_ode
### Title: Fit nlme-based mixed-effect model using ODE implementation
### Aliases: nlme_ode nlmeOde

### ** Examples

## Not run: 
##D library(nlmixr)
##D ode <- "
##D d/dt(depot) =-KA*depot;
##D d/dt(centr) = KA*depot - KE*centr;
##D "
##D dat <- read.table(system.file("examples/theo_md.txt", package = "nlmixr"), head=TRUE)
##D mypar <- function(lKA, lKE, lCL)
##D {
##D     KA=exp(lKA)
##D     KE=exp(lKE)
##D     CL=exp(lCL)
##D     V = CL/KE
##D }
##D 
##D specs <- list(fixed=lKA+lKE+lCL~1, random = pdDiag(lKA+lCL~1),
##D      start=c(lKA=0.5, lKE=-2.5, lCL=-3.2))
##D 
##D fit <- nlme_ode(theo_md, model=ode, par_model=specs, par_trans=mypar,
##D      response="centr", response.scaler="V",control=nlmeControl(pnlsTol=0.1))
##D 
## End(Not run)



