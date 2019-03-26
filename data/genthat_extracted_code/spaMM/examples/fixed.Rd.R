library(spaMM)


### Name: fixed
### Title: Fixing some parameters
### Aliases: fixed ranFix ranPars etaFix ranCoefs

### ** Examples

## Not run: 
##D data("wafers")
##D # Fixing random-coefficient parameters:
##D HLfit(y~X1+(X2|batch), data=wafers, ranFix=list(ranCoefs=list("1"=c(2760, -0.1, 1844))))
##D # fixing coefficients of the linear predictor, but with REML as if they were not fixed:
##D HLfit(y ~X1+X2+X1*X3+X2*X3+I(X2^2)+(1|batch), data=wafers, family=Gamma(log),
##D       etaFix=list(beta=c("(Intercept)"=5.61208, X1=0.08818, X2=-0.21163, X3=-0.13948, 
##D                          "I(X2^2)"=-0.10378, "X1:X3"=-0.08987, "X2:X3"=-0.08779)),
##D       REMLformula=y ~X1+X2+X1*X3+X2*X3+I(X2^2)+(1|batch))
##D 
##D data("Loaloa")
##D # Fixing some Matern correlation parameters, in corrHLfit:
##D corrHLfit(cbind(npos,ntot-npos)~elev1+elev2+elev3+elev4+maxNDVI1+seNDVI
##D            +Matern(1|longitude+latitude),
##D              data=Loaloa,family=binomial(),ranFix=list(nu=0.5,Nugget=2/7))
##D # Fixing all mandatory Matern correlation parameters, in HLCor:
##D HLCor(cbind(npos,ntot-npos)~elev1+elev2+elev3+elev4+maxNDVI1+seNDVI
##D            +Matern(1|longitude+latitude),
##D              data=Loaloa,family=binomial(),ranPars=list(nu=0.5,rho=0.7))
## End(Not run)



