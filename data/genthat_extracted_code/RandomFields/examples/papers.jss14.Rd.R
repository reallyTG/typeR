library(RandomFields)


### Name: jss14
### Title: Covariance models for multivariate and vector-valued fields
### Aliases: jss14
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
## Don't show: 
if (RFoptions()$internal$examples_reduced) RFoptions(modus_operandi="sloppy")
## End(Don't show)
## Not run: 
##D                ###########################################
##D                ##  SECTION 4: UNCONDITIONAL SIMULATION  ##
##D                ###########################################
##D 
##D RFoptions(seed = 0, height = 4)
##D ## seed=0:  *ANY* simulation will have the random seed 0; set
##D ##          RFoptions(seed=NA) to make them all random again
##D ## height : height of X11
##D ## always_close_device=FALSE: the pictures are kept on the screen
##D 
##D 
##D ## Fig. 1: linear model of coregionalization
##D M1 <- c(0.9, 0.6)
##D M2 <- c(sqrt(0.19), 0.8)
##D model <- RMmatrix(M = M1, RMwhittle(nu = 0.3)) + 
##D          RMmatrix(M = M2, RMwhittle(nu = 2))
##D x <- y <- seq(-10, 10,  0.2)
##D simu <- RFsimulate(model, x, y)
##D plot(simu)
##D 
##D 
##D ## Fig. 2: Wackernagel's delay model
##D model <- RMdelay(RMstable(alpha = 1.9, scale = 2), s = c(4, 4))
##D simu <- RFsimulate(model, x, y)
##D plot(simu, zlim = 'joint')
##D 
##D 
##D ## Fig. 3: extended Wackernagel's delay model
##D model <- RMdelay(RMstable(alpha = 1.9, scale = 2), s = c(0, 4)) + 
##D          RMdelay(RMstable(alpha = 1.9, scale = 2), s = c(4, 0))
##D simu <- RFsimulate(model, x, y)
##D plot(simu, zlim = 'joint')
##D plot(model, dim = 2, xlim = c(-5, 5), main = "Covariance function", 
##D      cex = 1.5, col = "brown")
##D 
##D 
##D ## Fig. 4: latent dimension model
##D ## MARGIN.slices has the effect of choosing the third dimension
##D ##               as latent dimension
##D ## n.slices has the effect of choosing a bivariate model
##D model <- RMgencauchy(alpha = 1.5, beta = 3)
##D simu <- RFsimulate(model, x, y, z = c(0,1))
##D plot(simu, MARGIN.slices = 3, n.slices = 2)
##D 
##D 
##D ## Fig. 5: Gneiting's bivariate Whittle-Matern model
##D model <- RMbiwm(nudiag = c(1, 2), nured = 1, rhored = 1, cdiag = c(1, 5), 
##D                 s = c(1, 1, 2))
##D simu <- RFsimulate(model, x, y)
##D plot(simu)
##D 
##D 
##D ## Fig. 6: anisotropic linear model of coregionalization
##D M1 <- c(0.9, 0.6)
##D M2 <- c(sqrt(0.19), 0.8)
##D A1 <- RMangle(angle = pi/4, diag = c(0.1, 0.5))
##D A2 <- RMangle(angle = 0, diag = c(0.1, 0.5))
##D model <- RMmatrix(M = M1, RMgengneiting(kappa = 0, mu = 2, Aniso = A1)) +
##D          RMmatrix(M = M2, RMgengneiting(kappa = 3, mu = 2, Aniso = A2))
##D simu <- RFsimulate(model, x, y)
##D plot(simu)
##D 
##D 
##D ## Fig. 7: random vector field whose paths are curl free
##D ## A 4-variate field is simulated, where the first component
##D ## refers to the potential field, the second and third component
##D ## to the curl free vector field and the forth component to the
##D ## field of sinks and sources
##D model <- RMcurlfree(RMmatern(nu = 5), scale = 4)
##D simu <- RFsimulate(model, x, y)
##D plot(simu, select.variables = list(1, 2 : 3, 4))
##D plot(model, dim = 2, xlim = c(-3, 3), main = "", cex = 2.3, col="brown") 
##D 
##D 
##D 
##D ## Fig. 8: Kolmogorov's model of turbulence
##D ## See the physical literature for its derivation and details
##D x <- y <- seq(-2, 2, len = 20)
##D model <- RMkolmogorov()
##D simu <- RFsimulate(model, x, y, z = 1)
##D plot(simu, select.variables = list(1 : 2), col = c("red"))
##D plot(model, dim = 3, xlim = c(-3, 3), MARGIN = 1 : 2, cex = 2.3,
##D      fixed.MARGIN = 1.0, main = "", col = "brown")
##D 
##D 
##D 
##D 
##D                ###########################################
##D                ## SECTION 5: DATA ANALYSIS              ##
##D                ###########################################
##D 
##D ## get the data     
##D data("weather")
##D PT <- weather[ , 1 : 2]  ## full data set takes more than 
##D ##                                     half an hour to be analysed
##D ## transformation of earth coordinates to Euclidean coordinates
##D Dist.mat <- as.vector(RFearth2dist(weather[ , 3 : 4]))
##D All <- TRUE
##D \dontshow{if(RFoptions()$internal$examples_reduced){warning("reduced data set")
##D All <- 1:10
##D PT <- weather[All , 1 : 2] 
##D Dist.mat <- as.vector(RFearth2dist(weather[All , 3 : 4]))
##D }}
##D 
##D 
##D 
##D #################################
##D ## model definition            ##
##D #################################
##D ## bivariate pure nugget effect:
##D nug <- RMmatrix(M = matrix(nc = 2, c(NA, 0, 0, NA)), RMnugget())
##D ## parsimonious bivariate Matern model
##D pars.model <- nug + RMbiwm(nudiag = c(NA, NA), scale = NA, cdiag = c(NA, NA),
##D                            rhored = NA)
##D ## whole bivariate Matern model
##D whole.model <- nug + RMbiwm(nudiag = c(NA, NA), nured = NA, s = rep(NA, 3),
##D                             cdiag = c(NA, NA), rhored = NA)
##D 
##D 
##D 
##D #################################
##D ## model fitting and testing   ## 
##D #################################
##D ## 'parsimonious model'
##D ## fitting takes a while ( > 10 min)
##D pars <- RFfit(pars.model, distances = Dist.mat, dim = 3, data = PT)
##D print(pars)
##D print(pars, full=TRUE)
##D RFratiotest(pars)
##D #RFcrossvalidate(pars, x = weather[All , 3 : 4], data = PT, full = TRUE)
##D 
##D ## 'whole model'
##D ## fitting takes a while ( > 10 min)
##D whole <- RFfit(whole.model, distances = Dist.mat, dim = 3, data = PT)
##D print(whole, full=TRUE)
##D RFratiotest(whole)
##D #RFcrossvalidate(whole, x = weather[All , 3 : 4], data = PT, full = TRUE)
##D 
##D ## compare parsimonious and whole
##D RFratiotest(nullmodel = pars, alternative = whole)
##D 
##D 
##D #################################
##D ## kriging                     ##
##D #################################
##D ## First, the coordinates are projected on a plane
##D a <- colMeans(weather[All , 3 : 4]) * pi / 180
##D P <- cbind(c(-sin(a[1]), cos(a[1]), 0),
##D            c(-cos(a[1]) * sin(a[2]), -sin(a[1]) * sin(a[2]), cos(a[2])),
##D            c(cos(a[1]) * cos(a[2]), sin(a[1]) * cos(a[2]), sin(a[2])))
##D x <- RFearth2cartesian(weather[All , 3 : 4])
##D plane <- (t(x) %*%P)[ , 1 : 2]
##D 
##D ## here, kriging is performed on a rectangular that covers
##D ## the projected points above. The rectangular is approximated
##D ## by a grid of length 200 in each direction.
##D n <- 200 
##D r <- apply(plane, 2, range)
##D dta <- cbind(plane, weather[All , 1 : 2])
##D z <- RFinterpolate(pars, data = dta, dim = 2,
##D                    x = seq(r[1, 1], r[2, 1], length = n),
##D                    y = seq(r[1, 2], r[2, 2], length = n),
##D                    varunits = c("Pa", "K"), spConform = TRUE)
##D plot(z)
## End(Not run)


## Don't show: 
RFoptions(modus_operandi="normal")
## End(Don't show)
## Don't show: 
FinalizeExample()
## End(Don't show)


