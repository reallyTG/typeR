library(copBasic)


### Name: EMPIRsim
### Title: Simulate a Bivariate Empirical Copula
### Aliases: EMPIRsim
### Keywords: empirical copula empirical copula (simulation)

### ** Examples

## Not run: 
##D pdf("EMPIRsim_experiment.pdf")
##D   nsim <- 5000
##D   para <- list(alpha=0.15, beta=0.65,
##D                cop1=PLACKETTcop, cop2=PLACKETTcop, para1=0.005, para2=1000)
##D   set.seed(1)
##D   uv <- simCOP(n=nsim, cop=composite2COP, para=para, snv=TRUE,
##D                pch=16, col=rgb(0,0,0,.2))
##D   mtext("A highly complex simulated bivariate relation")
##D   # set.seed(1) # try not resetting the seed
##D   uv.grid <- EMPIRgrid(para=uv, deluv=0.025)
##D 
##D   uv2 <- EMPIRsim(n=nsim, empgrid=uv.grid, kumaraswamy=FALSE, snv=TRUE,
##D                   col=rgb(1,0,0,0.1), pch=16)
##D   mtext("Resimulation without Kumaraswamy smoothing")
##D 
##D   uv3 <- EMPIRsim(n=nsim, empgrid=uv.grid, kumaraswamy=TRUE, snv=TRUE,
##D                   col=rgb(1,0,0,0.1),pch=16)
##D   mtext("Resimulation but using the Kumaraswamy Distribution for smoothing")
##D dev.off()#
## End(Not run)

## Not run: 
##D   set.seed(1)
##D   uv1 <- simCOP(n=5000, cop=PSP, para=NULL, snv=TRUE)
##D   semicorCOP(cop=EMPIRcop, para=uv2, samcor=TRUE)
##D   uv.grid <- EMPIRgrid(para=uv1, deluv=0.01)
##D   set.seed(1)
##D   uv2 <- EMPIRsim(n=5000, empgrid=uv.grid, snv=TRUE,
##D                   col=rgb(1,0,0,0.1), pch=16)
##D   mtext("Resimulation without Kumaraswamy smoothing")
##D   semicorCOP(cop=EMPIRcop, para=uv2, samcor=TRUE)#
## End(Not run)

# See other examples under EMPIRsimv



