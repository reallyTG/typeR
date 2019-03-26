library(copBasic)


### Name: lcomoms2.ABcop2parameter
### Title: Convert L-comoments to Parameters of Alpha-Beta Compositions of
###   Two One-Parameter Copulas
### Aliases: lcomoms2.ABcop2parameter
### Keywords: L-comoments copula composition

### ** Examples

## Not run: 
##D # Build an initial parameter to L-comoment mapping table.
##D   mainpara <- list(cop1=PLACKETTcop, cop2=PLACKETTcop,
##D                    para1gen=function() { return(10^runif(1, min=-5, max=0)) },
##D                    para2gen=function() { return(10^runif(1, min=0,  max=5)) })
##D   nsim <- 1E4
##D   sample.size.for.estimation <- 1000 # really use vastly larger sample size
##D   PlackettPlackettNP <-
##D       simcompositeCOP(n=sample.size.for.estimation, nsim=nsim, parent=mainpara)
##D   save(PlackettPlackettNP, file="PlackettPlackettNP.RData", compress="xz")
##D 
##D # Plackett-Plackett composited copula from the copBasic package
##D # Then create an environment to house the "table."
##D PlackettPlackett <- new.env()
##D assign("NeedToCreateForDemo", PlackettPlackettNP, envir=PlackettPlackett)
##D # Now that the table is assigned into the environment, the parameter
##D # estimation function can be used. In reality, a much much larger
##D # solution set is needed, but this effort is experimental.
##D 
##D # Now grab the closest Plackett-Plackett solution having the following six
##D # arbitrary L-comoments. Then simulate 1000 values and plot them to show
##D # the underlying bivariate distribution.
##D PPcop <- lcomoms2.ABcop2parameter(solutionenvir=PlackettPlackett,
##D                                   T2.12=-0.5059, T2.21=-0.5110,
##D                                   T3.12= 0.1500, T3.21= 0.1700,
##D                                   T4.12=-0.0500, T4.21= 0.0329,
##D                                   uset3err=TRUE, uset4err=TRUE)
##D # A user in encouraged to inspect the contents of PPcop to "assess" the
##D # solution by a method of L-comoments, we will now proceed with showing the
##D # copula via a simulation of the fitted version.
##D para <- list(cop1=PLACKETTcop, cop2=PLACKETTcop, alpha=PPcop$alpha, beta=PPcop$beta,
##D              para1=PPcop$Cop1Thetas, para2=PPcop$Cop2Thetas)
##D 
##D D <- simCOP(n=5000, cop=composite2COP, para=para, col=rgb(0,0,0,0.1), pch=16)
##D # The sample L-comoments of the fitted Plackett-Plackett may be found by
##D lmomco::lcomoms2(D, nmom=4) # from the lmomco package, and six sample values shown
##D T2.12 <- -0.5151547; T2.21 <- -0.5139863
##D T3.12 <-  0.1502336; T3.21 <-  0.1721355
##D T4.12 <- -0.0326277; T4.21 <-  0.0233979
##D PPcop <- lcomoms2.ABcop2parameter(solutionenvir=PlackettPlackett,
##D                                   T2.12=T2.12, T2.21=T2.21,
##D                                   T3.12=T3.12, T3.21=T3.21,
##D                                   T4.12=T4.12, T4.21=T4.21, uset4err=TRUE)
##D para <- list(cop1=PLACKETTcop, cop2=PLACKETTcop, alpha=PPcop$alpha, beta=PPcop$beta,
##D              para1=PPcop$Cop1Thetas, para2=PPcop$Cop2Thetas)
##D D <- simCOP(n=5000, cop=composite2COP, para=para, col=rgb(0,0,0,0.1), pch=16)
##D level.curvesCOP(cop=composite2COP, para=para, delt=.1, ploton=FALSE)
##D qua.regressCOP.draw(cop=composite2COP, para=para,
##D                     ploton=FALSE, f=seq(0.05, 0.95, by=0.05))
##D qua.regressCOP.draw(cop=composite2COP, para=para, wrtV=TRUE,
##D                     ploton=FALSE, f=seq(0.05, 0.95, by=0.05), col=c(3,2))
##D diag <- diagCOP(cop=composite2COP, para=para, ploton=FALSE, lwd=4)
##D 
##D image(gridCOP(cop=composite2COP, para=para), col=terrain.colors(20))
##D # One can inspect alternative solutions like this
##D # S <- PPcop$solutions$solutions[,1:16]
##D # B <- S[abs(S$t2.12res) < 0.02 & abs(S$t2.21res) < 0.02 &
##D #        abs(S$t3.12res) < 0.02 & abs(S$t3.21res) < 0.02, ]
##D #print(B) 
## End(Not run)



