library(copBasic)


### Name: FRECHETcop
### Title: The Fréchet Family Copula
### Aliases: FRECHETcop
### Keywords: Frechet Family copula copula (formulas) copula

### ** Examples

ppara <- c(0.25, 0.50)
fcop <- FRECHETcop(para=ppara, par2rhotau=TRUE)
RHO <- fcop$rho; TAU <- fcop$tau

## Not run: 
##D level.curvesCOP(cop=FRECHETcop, para=ppara) # Durante (2007, Fig. C.27(b))
##D mtext("Frechet Family copula")
##D  UV <- simCOP(n=50, cop=FRECHETcop, para=ppara, ploton=FALSE, points=FALSE)
##D tau <- cor(UV$U, UV$V, method="kendall" ) # sample Kendall Tau
##D rho <- cor(UV$U, UV$V, method="spearman") # sample Spearman Rho
##D spara <- FRECHETcop(rho=rho, tau=tau) # a fitted Frechet Family copula
##D spara <- spara$para
##D if(is.na(spara[1])) { # now a fittable combination is not guaranteed
##D    warning("sample rho and tau do not provide valid parameters, ",
##D            "try another simulation")
##D } else { # now if fit, draw some red-colored level curves for comparison
##D    level.curvesCOP(cop=FRECHETcop, para=spara, ploton=FALSE, col=2)
##D } #
## End(Not run)



