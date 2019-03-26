library(copBasic)


### Name: EMPIRsimv
### Title: Simulate a Bivariate Empirical Copula For a Fixed Value of U
### Aliases: EMPIRsimv
### Keywords: empirical copula empirical copula (simulation)

### ** Examples

## Not run: 
##D nsim <- 3000
##D para <- list(alpha=0.15,  beta=0.65,
##D              cop1=PLACKETTcop, cop2=PLACKETTcop, para1=.005, para2=1000)
##D set.seed(10)
##D uv <- simCOP(n=nsim, cop=composite2COP, para=para, pch=16, col=rgb(0,0,0,0.2))
##D uv.grid <- EMPIRgrid(para=uv, deluv=.1)
##D set.seed(1)
##D V1 <- EMPIRsimv(u=0.6, n=nsim, empgrid=uv.grid)
##D set.seed(1)
##D V2 <- EMPIRsimv(u=0.6, n=nsim, empgrid=uv.grid, kumaraswamy=TRUE)
##D plot(V1,V2)
##D abline(0,1)
##D 
##D invgrid1 <- EMPIRgridderinv(empgrid=uv.grid)
##D invgrid2 <- EMPIRgridderinv(empgrid=uv.grid, kumaraswamy=TRUE)
##D att <- attributes(invgrid2); kur <- att$kumaraswamy
##D # Now draw random variates from the Kumaraswamy distribution using
##D # rlmomco() and vec2par() provided by the lmomco package.
##D set.seed(1)
##D kurpar <- lmomco::vec2par(c(kur$Alpha[7], kur$Beta[7]), type="kur")
##D Vsim <- lmomco::rlmomco(nsim, kurpar)
##D 
##D print(summary(V1))   # Kumaraswamy not core in QDF reconstruction
##D print(summary(V2))   # Kumaraswamy core in QDF reconstruction
##D print(summary(Vsim)) # Kumaraswamy use of the kumaraswamy
##D 
##D # Continuing with a conditional quantile 0.74 that will not land along one of the
##D # grid lines, a weighted interpolation will be done.
##D set.seed(1) # try not resetting the seed
##D nsim <- 5000
##D V <- EMPIRsimv(u=0.74, n=nsim, empgrid=uv.grid)
##D # It is important that the uv.grid used to make V is the same grid used in inversion
##D # with kumaraswamy=TRUE to guarantee that the correct Kumaraswamy parameters are
##D # available if a user is doing cut and paste and exploring these examples.
##D set.seed(1)
##D V1 <- lmomco::rlmomco(nsim, lmomco::vec2par(c(kur$Alpha[8], kur$Beta[8]), type="kur"))
##D set.seed(1)
##D V2 <- lmomco::rlmomco(nsim, lmomco::vec2par(c(kur$Alpha[9], kur$Beta[9]), type="kur"))
##D 
##D plot( lmomco::pp(V),  sort(V), type="l", lwd=4, col=8) # GREY is empirical from grid
##D lines(lmomco::pp(V1), sort(V1), col=2, lwd=2) # Kumaraswamy at u=0.7 # RED
##D lines(lmomco::pp(V2), sort(V2), col=3, lwd=2) # Kumaraswamy at u=0.8 # GREEN
##D 
##D W1 <- 0.74 - 0.7; W2 <- 0.8 - 0.74
##D Vblend <- (V1/W1 + V2/W2) / sum(1/W1 + 1/W2)
##D lines(lmomco::pp(Vblend), sort(Vblend), col=4, lwd=2) # BLUE LINE
##D # Notice how the grey line and the blue diverge for about F < 0.1 and F > 0.9.
##D # These are the limits of the grid spacing and linear interpolation within the
##D # grid intervals is being used and not direct simulation from the Kumaraswamy.
## End(Not run)



