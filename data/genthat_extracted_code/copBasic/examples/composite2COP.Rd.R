library(copBasic)


### Name: composite2COP
### Title: Composition of Two Copulas with Two Compositing Parameters
### Aliases: composite2COP
### Keywords: copula composition copula composition (two compositing
###   parameters)

### ** Examples

alpha <- 0.24; beta <- 0.23; Theta1 <- NA; Theta2 <- NA
# The W() and PSP() copulas do not take parameters, but example shows how the
# parameters would be set should either or both of the copulas require parameters.
para <- list(alpha=alpha, beta=beta, cop1=W, cop2=PSP, para1=Theta1, para2=Theta2)
print(composite2COP(0.4,0.6,para)) # 0.2779868

# In this example, the N4212cop uses "3" as its parameter value.
para <- list(alpha=alpha, beta=beta, cop1=W, cop2=N4212cop, para1=Theta1, para2=3)
print(composite2COP(0.4,0.6,para)) # 0.3387506

## Not run: 
##D # This example does a great job of showing a composited copula with a near singularity,
##D # but with leakage of chance to the upper left. The example is also critical because
##D # it shows that gridCOP is returning a matrix in the proper orientation relative to
##D # the level.curvesCOP and simCOP functions. Example is cross-ref'ed from gridCOP() docs.
##D layout(matrix(1:2,byrow=TRUE))
##D para <- list(alpha=0.5, beta=0.90, cop1=M, cop2=N4212cop, para1=NA, para2=1.4)
##D image(gridCOP(cop=composite2COP, para=para, delta=0.01), col=terrain.colors(30),
##D       xlab="U, NONEXCEEDANCE PROBABILITY", ylab="V, NONEXCEEDANCE PROBABILITY")
##D D <- simCOP(n=2000, cop=composite2COP, para=para, ploton=FALSE, pch=4, col=4, cex=0.75)
##D level.curvesCOP(cop=composite2COP, para=para, ploton=FALSE, delt = 0.05)
##D mtext("Theoretical composited copula, level curves, and simulation")
##D 
##D emp <- EMPIRgrid(para=D, deluv = 0.05)     # CPU heavy
##D image(emp$empcop, col=terrain.colors(30) ) # image orientation is correct!
##D # Depending on balance between sample size, deluv, delu, and delt, one or more:
##D # Error in uniroot(func, interval = c(0, 1), u = u, LHS = t, cop = cop,  :
##D #   f() values at end points not of opposite sign
##D # warnings might be triggered. This is particularly true because of the flat derivative
##D # above the near singularity in this example composited copula.
##D points(D$U, D$V, pch=4, col=4, cex=0.75)
##D level.curvesCOP(cop=EMPIRcop, para=D, ploton=FALSE, delu=0.02, delt = 0.05)
##D mtext("Empirical copula from n=2000 simulation") #
## End(Not run)



