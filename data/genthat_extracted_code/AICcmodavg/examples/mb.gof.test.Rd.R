library(AICcmodavg)


### Name: mb.gof.test
### Title: Compute MacKenzie and Bailey Goodness-of-fit Test for Single
###   Season and Dynamic Occupancy Models
### Aliases: mb.gof.test mb.gof.test.default mb.gof.test.unmarkedFitOccu
###   mb.gof.test.unmarkedFitColExt mb.chisq mb.chisq.default
###   mb.chisq.unmarkedFitOccu mb.chisq.unmarkedFitColExt print.mb.chisq
### Keywords: models

### ** Examples

##single-season occupancy model example modified from ?occu
## Not run: 
##D require(unmarked)
##D ##single season
##D data(frogs)
##D pferUMF <- unmarkedFrameOccu(pfer.bin)
##D ## add some fake covariates for illustration
##D siteCovs(pferUMF) <- data.frame(sitevar1 = rnorm(numSites(pferUMF)),
##D                                 sitevar2 = rnorm(numSites(pferUMF))) 
##D      
##D ## observation covariates are in site-major, observation-minor order
##D obsCovs(pferUMF) <- data.frame(obsvar1 = rnorm(numSites(pferUMF) *
##D                                  obsNum(pferUMF))) 
##D 
##D ##run model
##D fm1 <- occu(~ obsvar1 ~ sitevar1, pferUMF)
##D 
##D ##compute observed chi-square
##D obs <- mb.chisq(fm1)
##D obs
##D ##round to 4 digits after decimal point
##D print(obs, digits.vals = 4)
##D 
##D 
##D ##compute observed chi-square, assess significance, and estimate c-hat
##D obs.boot <- mb.gof.test(fm1, nsim = 3)
##D ##note that more bootstrap samples are recommended
##D ##(e.g., 1000, 5000, or 10 000)
##D obs.boot
##D print(obs.boot, digits.vals = 4, digits.chisq = 4)
##D 
##D 
##D ##data with missing values
##D mat1 <- matrix(c(0, 0, 0), nrow = 120, ncol = 3, byrow = TRUE)
##D mat2 <- matrix(c(0, 0, 1), nrow = 23, ncol = 3, byrow = TRUE)
##D mat3 <- matrix(c(1, NA, NA), nrow = 42, ncol = 3, byrow = TRUE)
##D mat4 <- matrix(c(0, 1, NA), nrow = 33, ncol = 3, byrow = TRUE)
##D y.mat <- rbind(mat1, mat2, mat3, mat4)
##D y.sim.data <- unmarkedFrameOccu(y = y.mat)
##D m1 <- occu(~ 1 ~ 1, data = y.sim.data)
##D 
##D mb.gof.test(m1, nsim = 3)
##D ##note that more bootstrap samples are recommended
##D ##(e.g., 1000, 5000, or 10 000) 
##D detach(package:unmarked)
## End(Not run)



