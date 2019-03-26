library(copBasic)


### Name: EMPIRgrid
### Title: Grid of the Bivariate Empirical Copula
### Aliases: EMPIRgrid
### Keywords: empirical copula empirical copula (utility) copulatic surface

### ** Examples

## Not run: 
##D # EXAMPLE 1:
##D psp <- simCOP(n=490, cop=PSP, ploton=FALSE, points=FALSE) * 150
##D # Pretend psp is real data, the * 150 is to clearly get into an arbitrary unit system.
##D 
##D # The sort=FALSE is critical in the following two calls to pp() from lmomco.
##D fakeU <- lmomco::pp(psp[,1], sort=FALSE)   # Weibull plotting position i/(n+1)
##D fakeV <- lmomco::pp(psp[,2], sort=FALSE)   # Weibull plotting position i/(n+1)
##D uv <- data.frame(U=fakeU, V=fakeV) # our U-statistics
##D 
##D # The follow function is used to make 3-D --> 2-D transformation
##D # From R Graphics by Murrell (2005, p.112)
##D "trans3d" <- function(x,y,z, pmat) {
##D    tmat <- cbind(x,y,z,1) %*% pmat; return(tmat[,1:2] / tmat[,4])
##D }
##D 
##D the.grid <- EMPIRgrid(para=uv)
##D cop.diag <- diagCOP(cop=EMPIRcop, para=uv, ploton=FALSE, lines=FALSE)
##D empcop   <- EMPIRcopdf(para=uv) # data.frame of all points
##D 
##D # EXAMPLE 1: PLOT NUMBER 1
##D the.persp <- persp(the.grid$empcop, theta=-25, phi=20,
##D                    xlab="U VARIABLE", ylab="V VARIABLE", zlab="COPULA C(u,v)")
##D 
##D # EXAMPLE 1: PLOT NUMBER 2 (see change in interaction with variable 'the.grid')
##D the.persp <- persp(x=the.grid$u, y=the.grid$v, z=the.grid$empcop, theta=-25, phi=20,
##D                    xlab="U VARIABLE", ylab="V VARIABLE", zlab="COPULA C(u,v)")
##D 
##D the.diag <- trans3d(cop.diag$t, cop.diag$t, cop.diag$diagcop, the.persp)
##D lines(the.diag, lwd=4, col=3, lty=2)
##D 
##D points(trans3d(empcop$u, empcop$v, empcop$empcop, the.persp),
##D        col=rgb(0,1-sqrt(empcop$empcop),1,sqrt(empcop$empcop)), pch=16)
##D # the sqrt() is needed to darken or enhance the colors
##D 
##D S <- sectionCOP(cop=PSP, 0.2, ploton=FALSE, lines=FALSE)
##D thelines <- trans3d(rep(0.2, length(S$t)), S$t, S$seccop, the.persp)
##D lines(thelines, lwd=2, col=6)
##D S <- sectionCOP(cop=PSP, 0.2, ploton=FALSE, lines=FALSE, dercop=TRUE)
##D thelines <- trans3d(rep(0.2, length(S$t)), S$t, S$seccop, the.persp)
##D lines(thelines, lwd=2, col=6, lty=2)
##D 
##D S <- sectionCOP(cop=PSP, 0.85, ploton=FALSE, lines=FALSE, wrtV=TRUE)
##D thelines <- trans3d(S$t, rep(0.85, length(S$t)), S$seccop, the.persp)
##D lines(thelines, lwd=2, col=2)
##D S <- sectionCOP(cop=PSP, 0.85, ploton=FALSE, lines=FALSE, dercop=TRUE)
##D thelines <- trans3d(S$t, rep(0.85, length(S$t)), S$seccop, the.persp)
##D lines(thelines, lwd=2, col=2, lty=2)
##D 
##D empder <- EMPIRgridder(empgrid=the.grid)
##D thelines <- trans3d(rep(0.2, length(the.grid$v)), the.grid$v, empder[3,], the.persp)
##D lines(thelines, lwd=4, col=6) #
## End(Not run)

## Not run: 
##D # EXAMPLE 2:
##D # An asymmetric example to demonstrate that the grid is populated with the
##D # correct orientation---meaning U is the horizontal and V is the vertical.
##D "MOcop" <- function(u,v, para=NULL) { # Marshall-Olkin copula
##D    alpha <- para[1]; beta  <- para[2]; return(min(v*u^(1-alpha), u*v^(1-beta)))
##D }
##D # EXAMPLE 2: PLOT NUMBER 1 # Note the asymmetry!
##D uv <- simCOP(1000, cop=MOcop, para=c(0.4,0.9)) # The parameters cause asymmetry.
##D mtext("Simulation from a defined Marshall-Olkin Copula")
##D the.grid <- EMPIRgrid(para=uv, deluv=0.025)
##D 
##D # EXAMPLE 2: PLOT NUMBER 2
##D # The second plot by image() will show a "hook" of sorts along the singularity.
##D image(the.grid$empcop, col=terrain.colors(40)) # Second plot is made
##D mtext("Image of gridded Empirical Copula")
##D 
##D # EXAMPLE 2: PLOT NUMBER 3
##D empcop <- EMPIRcopdf(para=uv) # data.frame of all points
##D # The third plot is the 3-D version overlain with the data points.
##D the.persp <- persp(x=the.grid$u, y=the.grid$v, z=the.grid$empcop, theta=240, phi=40,
##D                    xlab="U VARIABLE", ylab="V VARIABLE", zlab="COPULA C(u,v)")
##D points(trans3d(empcop$u, empcop$v, empcop$empcop, the.persp),
##D        col=rgb(0,1-sqrt(empcop$empcop),1,sqrt(empcop$empcop)), pch=16)
##D mtext("3-D representation of gridded empirical copula with data points")
##D 
##D # EXAMPLE 2: PLOT NUMBER 4
##D # The fourth plot shows a simulation and the quasi-emergence of the singularity
##D # that of course the empirical perspective "knows" nothing about. Do not use
##D # the Kumaraswamy smoothing because in this case the singularity because
##D # too smoothed out relative to the raw empirical, but of course the sample size
##D # is large enough to see such things. (Try kumaraswamy=TRUE)
##D empsim <- EMPIRsim(n=1000, empgrid = the.grid, kumaraswamy=FALSE)
##D mtext("Simulations from the Empirical Copula") #
## End(Not run)

## Not run: 
##D # EXAMPLE 3:
##D psp <- simCOP(n=4900, cop=PSP, ploton=FALSE, points=FALSE) * 150
##D # Pretend psp is real data, the * 150 is to clearly get into an arbitrary unit system.
##D 
##D # The sort=FALSE is critical in the following two calls to pp() from lmomco.
##D fakeU <- lmomco::pp(psp[,1], sort=FALSE)   # Weibull plotting position i/(n+1)
##D fakeV <- lmomco::pp(psp[,2], sort=FALSE)   # Weibull plotting position i/(n+1)
##D uv <- data.frame(U=fakeU, V=fakeV) # our U-statistics
##D 
##D # EXAMPLE 3: # PLOT NUMBER 1
##D deluv <- 0.0125 # going to cause long run time with large n
##D # The small deluv is used to explore solution quality at U=0 and 1.
##D the.grid <- EMPIRgrid(para=uv, deluv=deluv)
##D the.persp <- persp(x=the.grid$u, y=the.grid$v, z=the.grid$empcop, theta=-25, phi=20,
##D                    xlab="U VARIABLE", ylab="V VARIABLE", zlab="COPULA C(u,v)")
##D 
##D S <- sectionCOP(cop=PSP, 1, ploton=FALSE, lines=FALSE)
##D thelines <- trans3d(rep(1, length(S$t)), S$t, S$seccop, the.persp)
##D lines(thelines, lwd=2, col=2)
##D 
##D S <- sectionCOP(cop=PSP, 0, ploton=FALSE, lines=FALSE)
##D thelines <- trans3d(rep(0, length(S$t)), S$t, S$seccop, the.persp)
##D lines(thelines, lwd=2, col=2)
##D 
##D S <- sectionCOP(cop=PSP, 1, ploton=FALSE, lines=FALSE, dercop=TRUE)
##D thelines <- trans3d(rep(1, length(S$t)), S$t, S$seccop, the.persp)
##D lines(thelines, lwd=2, col=2, lty=2)
##D 
##D S <- sectionCOP(cop=PSP, 2*deluv, ploton=FALSE, lines=FALSE, dercop=TRUE)
##D thelines <- trans3d(rep(2*deluv, length(S$t)), S$t, S$seccop, the.persp)
##D lines(thelines, lwd=2, col=2, lty=2)
##D 
##D empder <- EMPIRgridder(empgrid=the.grid)
##D thelines <- trans3d(rep(2*deluv,length(the.grid$v)),the.grid$v,empder[3,],the.persp)
##D lines(thelines, lwd=4, col=5, lty=2)
##D 
##D pdf("conditional_distributions.pdf")
##D   ix <- 1:length(attributes(empder)$rownames)
##D   for(i in ix) {
##D      u <- as.numeric(attributes(empder)$rownames[i])
##D      S <- sectionCOP(cop=PSP, u, ploton=FALSE, lines=FALSE, dercop=TRUE)
##D      # The red line is the true.
##D      plot(S$t, S$seccop, lwd=2, col=2, lty=2, type="l", xlim=c(0,1), ylim=c(0,1),
##D           xlab="V, NONEXCEEDANCE PROBABILITY", ylab="V, VALUE")
##D      lines(the.grid$v, empder[i,], lwd=4, col=5, lty=2) # empirical
##D      mtext(paste("Conditioned on U=",u," nonexceedance probability"))
##D   }
##D dev.off()#
## End(Not run)



