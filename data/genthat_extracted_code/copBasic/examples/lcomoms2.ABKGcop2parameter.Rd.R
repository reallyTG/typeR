library(copBasic)


### Name: lcomoms2.ABKGcop2parameter
### Title: Convert L-comoments to Parameters of Alpha-Beta-Kappa-Gamma
###   Compositions of Two One-Parameter Copulas
### Aliases: lcomoms2.ABKGcop2parameter
### Keywords: L-comoments copula composition

### ** Examples

## Not run: 
##D   mainpara <- list(cop1=PLACKETTcop, cop2=PLACKETTcop,
##D                    para1gen=function() { return(10^runif(1, min=-5, max=5)) },
##D                    para2gen=function() { return(10^runif(1, min=-5, max=5)) })
##D   nsim <- 1E4
##D   sample.size.for.estimation <- 1000
##D   PlackettPlackettABKGtest <-
##D       simcomposite3COP(n=sample.size.for.estimation, nsim=nsim, parent=mainpara)
##D   save(PlackettPlackettABKGtest,file="PlackettPlackettABKG.RData",compress="xz")
##D 
##D # Plackett-Plackett composited copula from the copBasic package
##D # Then create an environment to house the "table".
##D PlackettPlackettABKG <- new.env()
##D assign("NeedToCreateForDemo", PlackettPlackettABKGtest, envir=PlackettPlackettABKG)
##D 
##D # Now that the table is assigned into the environment, the parameter estimation
##D # function can be used. In reality a much much larger solution set is needed.
##D # Assume one had the following six L-comoments, extract a possible solution.
##D PPcop <- lcomoms2.ABKGcop2parameter(solutionenvir=PlackettPlackettABKG,
##D                                     T2.12=-0.5059, T2.21=-0.5110,
##D                                     T3.12= 0.1500, T3.21= 0.1700,
##D                                     T4.12=-0.0500, T4.21= 0.0329,
##D                                     uset3err=TRUE, uset4err=TRUE)
##D # Now take that solution and setup a parameter object.
##D para <- list(cop1=PLACKETTcop, cop2=PLACKETTcop,
##D              alpha=PPcop$alpha, beta=PPcop$beta, kappa=PPcop$kappa, gamma=PPcop$gamma,
##D              para1=PPcop$Cop1Thetas, para2=PPcop$Cop2Thetas)
##D 
##D # Example Plot Number 1
##D D <- simCOP(n=2000, cop=composite3COP,  para=para, col=rgb(0,0,0,0.1), pch=16)
##D print(lmomco::lcomoms2(D, nmom=4)) # See the six extacted sample values for this seed.
##D T2.12 <- -0.4877171; T2.21 <- -0.4907403
##D T3.12 <-  0.1642508; T3.21 <-  0.1715944
##D T4.12 <- -0.0560310; T4.21 <- -0.0350028
##D PPcop <- lcomoms2.ABKGcop2parameter(solutionenvir=PlackettPlackettABKG,
##D                                     T2.12=T2.12, T2.21=T2.21,
##D                                     T3.12=T3.12, T3.21=T3.21,
##D                                     T4.12=T4.12, T4.21=T4.21, uset4err=TRUE)
##D para <- list(cop1=PLACKETTcop, cop2=PLACKETTcop,
##D              alpha=PPcop$alpha, beta=PPcop$beta, kappa=PPcop$kappa, gamma=PPcop$gamma,
##D              para1=PPcop$Cop1Thetas, para2=PPcop$Cop2Thetas)
##D 
##D # Example Plot Number 2
##D D <- simCOP(n=1000, cop=composite3COP, para=para, col=rgb(0,0,0,0.1), pch=16)
##D level.curvesCOP(cop=composite3COP, para=para, delt=0.1, ploton=FALSE)
##D qua.regressCOP.draw(cop=composite3COP, para=para,
##D                     ploton=FALSE, f=c(seq(0.05, 0.95, by=0.05)))
##D qua.regressCOP.draw(cop=composite3COP, para=para, wrtV=TRUE,
##D                     ploton=FALSE, f=c(seq(0.05, 0.95, by=0.05)), col=c(3,2))
##D diag <- diagCOP(cop=composite3COP, para=para, ploton=FALSE, lwd=4)
##D # Compare plots 1 and 2, some generalized consistency between the two is evident.
##D # One can inspect alternative solutions like this
##D # S <- PPcop$solutions$solutions[,1:18]
##D # B <- S[abs(S$t2.12res) < 0.02 & abs(S$t2.21res) < 0.02 &
##D #        abs(S$t3.12res) < 0.02 & abs(S$t3.21res) < 0.02, ]
##D #print(B)
## End(Not run)



