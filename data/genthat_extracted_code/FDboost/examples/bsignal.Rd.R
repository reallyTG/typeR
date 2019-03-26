library(FDboost)


### Name: bsignal
### Title: Base-learners for Functional Covariates
### Aliases: bsignal bconcurrent bhist bfpc bconcurrent bhist bfpc
### Keywords: models

### ** Examples

######## Example for scalar-on-function-regression with bsignal()  
data("fuelSubset", package = "FDboost")

## center the functional covariates per observed wavelength
fuelSubset$UVVIS <- scale(fuelSubset$UVVIS, scale = FALSE)
fuelSubset$NIR <- scale(fuelSubset$NIR, scale = FALSE)

## to make mboost:::df2lambda() happy (all design matrix entries < 10)
## reduce range of argvals to [0,1] to get smaller integration weights
fuelSubset$uvvis.lambda <- with(fuelSubset, (uvvis.lambda - min(uvvis.lambda)) /
                                  (max(uvvis.lambda) - min(uvvis.lambda) ))
fuelSubset$nir.lambda <- with(fuelSubset, (nir.lambda - min(nir.lambda)) /
                                (max(nir.lambda) - min(nir.lambda) ))

## model fit with scalar response and two functional linear effects 
## include no intercept 
## as all base-learners are centered around 0 
mod2 <- FDboost(heatan ~ bsignal(UVVIS, uvvis.lambda, knots = 40, df = 4, check.ident = FALSE) 
               + bsignal(NIR, nir.lambda, knots = 40, df=4, check.ident = FALSE), 
               timeformula = NULL, data = fuelSubset) 
summary(mod2) 
## plot(mod2)


###############################################
### data simulation like in manual of pffr::ff

if(require(refund)){

#########
# model with linear functional effect, use bsignal()
# Y(t) = f(t) + \int X1(s)\beta(s,t)ds + eps
set.seed(2121)
data1 <- pffrSim(scenario = "ff", n = 40)
data1$X1 <- scale(data1$X1, scale = FALSE)
dat_list <- as.list(data1)
dat_list$t <- attr(data1, "yindex")
dat_list$s <- attr(data1, "xindex")

## model fit by FDboost 
m1 <- FDboost(Y ~ 1 + bsignal(x = X1, s = s, knots = 5), 
              timeformula = ~ bbs(t, knots = 5), data = dat_list, 
              control = boost_control(mstop = 21))

## search optimal mSTOP
## Not run: 
##D   set.seed(123)
##D   cv <- validateFDboost(m1, grid = 1:100) # 21 iterations
## End(Not run)

## model fit by pffr
t <- attr(data1, "yindex")
s <- attr(data1, "xindex")
m1_pffr <- pffr(Y ~ ff(X1, xind = s), yind = t, data = data1)

## Not run: 
##D   par(mfrow = c(2, 2))
##D   plot(m1, which = 1); plot(m1, which = 2) 
##D   plot(m1_pffr, select = 1, shift = m1_pffr$coefficients["(Intercept)"]) 
##D   plot(m1_pffr, select = 2)
## End(Not run)


############################################
# model with functional historical effect, use bhist() 
# Y(t) = f(t)  + \int_0^t X1(s)\beta(s,t)ds + eps
set.seed(2121)
mylimits <- function(s, t){
  (s < t) | (s == t)
}
data2 <- pffrSim(scenario = "ff", n = 40, limits = mylimits)
data2$X1 <- scale(data2$X1, scale = FALSE)
dat2_list <- as.list(data2)
dat2_list$t <- attr(data2, "yindex")
dat2_list$s <- attr(data2, "xindex")

## model fit by FDboost 
m2 <- FDboost(Y ~ 1 + bhist(x = X1, s = s, time = t, knots = 5), 
              timeformula = ~ bbs(t, knots = 5), data = dat2_list, 
              control = boost_control(mstop = 40))
              
## search optimal mSTOP
## Not run: 
##D   set.seed(123)
##D   cv2 <- validateFDboost(m2, grid = 1:100) # 40 iterations
## End(Not run)               

## model fit by pffr
t <- attr(data2, "yindex")
s <- attr(data2, "xindex")
m2_pffr <- pffr(Y ~ ff(X1, xind = s, limits = "s<=t"), yind = t, data = data2)

## Not run: 
##D par(mfrow = c(2, 2))
##D plot(m2, which = 1); plot(m2, which = 2)
##D ## plot of smooth intercept does not contain m1_pffr$coefficients["(Intercept)"]
##D plot(m2_pffr, select = 1, shift = m2_pffr$coefficients["(Intercept)"]) 
##D plot(m2_pffr, select = 2) 
##D 
## End(Not run)


}





