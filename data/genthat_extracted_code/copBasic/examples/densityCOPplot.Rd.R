library(copBasic)


### Name: densityCOPplot
### Title: Contour Density Plot of a Copula
### Aliases: densityCOPplot
### Keywords: visualization copula (density) Joe (2014) Examples and
###   Exercises

### ** Examples

## Not run: 
##D # Joe (2014, p. 5) names rMTCJ = reflected Mardia-Takahasi-Cook-Johnson copula
##D "rMTCJ" <- function(u,v,para, ...) {
##D    u + v - 1 + ((1-u)^(-para) + (1-v)^(-para) - 1)^(-1/para)
##D } # Survival Copula ("reflected" in Joe's terms)
##D densityCOPplot(cop=rMTCJ, para=1.0760, n=9000)
##D # The density plot matches that shown by Joe (2014, p. 11, fig. 1.2, lower left plot)
##D # for a Spearman's Rho equaling 0.5. Let us compute then Rho:
##D rhoCOP(cop=rMTCJ, para=1.076075) # 0.4999958
##D 
##D # Now let us get really wild with a composition with TWO modes!
##D # This example also proves that the grid orientation is consistent with respect
##D # to the orientation of the simulations.
##D para <- list(alpha=0.15, beta=0.90, kappa=0.06, gamma=0.96,
##D              cop1=GHcop, cop2=PLACKETTcop, para1=5.5, para2=0.07)
##D densityCOPplot(cop=composite2COP, para=para, n=9000)
##D 
##D # Now let us hack back to a contour density plot with U(0,1) and not N(0,1) margins
##D # just so show that capability exists, but emphasis of densityCOPplot is clearly
##D # on Joe's advocation so it does not have a trigger to use U(0,1) margins.
##D set.seed(12)
##D H <- densityCOPplot(cop=PLACKETTcop, para=41.25, getmatrix="cden", n=1000)
##D set.seed(12)
##D UV <- simCOP(cop=PLACKETTcop, para=41.25, n=1000, col=8)
##D U <- as.numeric(colnames(H)); V <- as.numeric(rownames(H))
##D contour(x=U, y=V, z=t(H), lwd=1.5, cex=2, add=TRUE, col=2) # 
## End(Not run)

## Not run: 
##D UV <- rCOP(400,  cop=PSP, pch=16, col=8, n=400)
##D CL <- mleCOP(UV, cop=CLcop,   interval=c(1,20))
##D JO <- mleCOP(UV, cop=JOcopB5, interval=c(.1,20))
##D PL <- mleCOP(UV, cop=PLcop,   interval=c(.1,20))
##D 
##D AICs <- c(CL$AIC, JO$AIC, PL$AIC)
##D names(AICs) <- c("Clayton", "Joe(B5)", "Plackett")
##D print(round(AICs, digits=2))
##D # Clayton    Joe(B5)   Plackett 
##D #  -167.15   -36.91  -131.35
##D # So we conclude Clayton must be the best fit of the three.
##D 
##D plot(qnorm(UV[,1]), qnorm(UV[,2]), pch=16, col=8,
##D      xlim=c(-3,3), ylim=c(-3,3), cex=0.5,
##D      xlab="Standard normal variate of V",
##D      ylab="Standard normal variate of U")
##D densityCOPplot(cop=PSP, contour.col=grey(0.5), lty=2,
##D                contour.lwd=3.5, ploton=FALSE)
##D densityCOPplot(cop=CLcop,     para=CL$para,
##D                contour.col=2, ploton=FALSE)
##D densityCOPplot(cop=JOcopB5,   para=JO$para,
##D                contour.col=3, ploton=FALSE)
##D densityCOPplot(cop=PLcop,     para=PL$para,
##D                contour.col=4, ploton=FALSE) # 
## End(Not run)



