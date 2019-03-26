library(FDboost)


### Name: FDboost
### Title: Model-based Gradient Boosting for Functional Response
### Aliases: FDboost
### Keywords: models, nonlinear

### ** Examples

######## Example for function-on-scalar-regression 
data("viscosity", package = "FDboost") 
## set time-interval that should be modeled
interval <- "101"

## model time until "interval" and take log() of viscosity
end <- which(viscosity$timeAll == as.numeric(interval))
viscosity$vis <- log(viscosity$visAll[,1:end])
viscosity$time <- viscosity$timeAll[1:end]
# with(viscosity, funplot(time, vis, pch = 16, cex = 0.2))

## fit median regression model with 100 boosting iterations,
## step-length 0.4 and smooth time-specific offset
## the factors are coded such that the effects are zero for each timepoint t
## no integration weights are used!
mod1 <- FDboost(vis ~ 1 + bolsc(T_C, df = 2) + bolsc(T_A, df = 2),
               timeformula = ~ bbs(time, df = 4),
               numInt = "equal", family = QuantReg(),
               offset = NULL, offset_control = o_control(k_min = 9),
               data = viscosity, control=boost_control(mstop = 100, nu = 0.4))

## Not run: 
##D   #### find optimal mstop over 5-fold bootstrap, small number of folds for example
##D   #### do the resampling on the level of curves
##D   
##D   ## possibility 1: smooth offset and transformation matrices are refitted 
##D   set.seed(123)
##D   appl1 <- applyFolds(mod1, folds = cv(rep(1, length(unique(mod1$id))), B = 5), 
##D                       grid = 1:500)
##D   ## plot(appl1)
##D   mstop(appl1)
##D   mod1[mstop(appl1)]
##D   
##D   ## possibility 2: smooth offset is refitted, 
##D   ## computes oob-risk and the estimated coefficients on the folds
##D   set.seed(123)
##D   val1 <- validateFDboost(mod1, folds = cv(rep(1, length(unique(mod1$id))), B = 5), 
##D                         grid = 1:500)
##D   ## plot(val1)
##D   mstop(val1)
##D   mod1[mstop(val1)]
##D 
##D   ## possibility 3: very efficient 
##D   ## using the function cvrisk; be careful to do the resampling on the level of curves
##D   folds1 <- cvLong(id = mod1$id, weights = model.weights(mod1), B = 5)
##D   cvm1 <- cvrisk(mod1, folds = folds1, grid = 1:500)
##D   ## plot(cvm1)
##D   mstop(cvm1)
##D   
##D ## look at the model
##D summary(mod1)
##D coef(mod1)
##D plot(mod1)
##D plotPredicted(mod1, lwdPred = 2)
## End(Not run)

######## Example for scalar-on-function-regression 
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

## model fit with scalar response 
## include no intercept as all base-learners are centered around 0
mod2 <- FDboost(heatan ~ bsignal(UVVIS, uvvis.lambda, knots = 40, df = 4, check.ident = FALSE) 
               + bsignal(NIR, nir.lambda, knots = 40, df = 4, check.ident = FALSE), 
               timeformula = NULL, data = fuelSubset, control = boost_control(mstop = 200)) 
               
## additionally include a non-linear effect of the scalar variable h2o 
mod2s <- FDboost(heatan ~ bsignal(UVVIS, uvvis.lambda, knots = 40, df = 4, check.ident = FALSE) 
               + bsignal(NIR, nir.lambda, knots = 40, df = 4, check.ident = FALSE) 
               + bbs(h2o, df = 4), 
               timeformula = NULL, data = fuelSubset, control = boost_control(mstop = 200)) 
               
## alternative model fit as FLAM model with scalar response; as timeformula = ~ bols(1)  
## adds a penalty over the index of the response, i.e., here a ridge penalty
## thus, mod2f and mod2 have different penalties 
mod2f <- FDboost(heatan ~ bsignal(UVVIS, uvvis.lambda, knots = 40, df = 4, check.ident = FALSE) 
               + bsignal(NIR, nir.lambda, knots = 40, df = 4, check.ident = FALSE), 
               timeformula = ~ bols(1), data = fuelSubset, control = boost_control(mstop = 200))
               
## Not run: 
##D    
##D   ## bootstrap to find optimal mstop takes some time
##D   set.seed(123)      
##D   folds2 <- cv(weights = model.weights(mod2), B = 10)     
##D   cvm2 <- cvrisk(mod2, folds = folds2, grid = 1:1000)
##D   mstop(cvm2) ## mod2[327]
##D   summary(mod2) 
##D   ## plot(mod2)
## End(Not run)

## Example for function-on-function-regression 
if(require(fda)){

  data("CanadianWeather", package = "fda")
  CanadianWeather$l10precip <- t(log(CanadianWeather$monthlyPrecip))
  CanadianWeather$temp <- t(CanadianWeather$monthlyTemp)
  CanadianWeather$region <- factor(CanadianWeather$region)
  CanadianWeather$month.s <- CanadianWeather$month.t <- 1:12
  
  ## center the temperature curves per time-point
  CanadianWeather$temp <- scale(CanadianWeather$temp, scale = FALSE)
  rownames(CanadianWeather$temp) <- NULL ## delete row-names
  
  ## fit model with cyclic splines over the year
  mod3 <- FDboost(l10precip ~ bols(region, df = 2.5, contrasts.arg = "contr.dummy") 
                   + bsignal(temp, month.s, knots = 11, cyclic = TRUE, 
                             df = 2.5, boundary.knots = c(0.5,12.5), check.ident = FALSE), 
                  timeformula = ~ bbs(month.t, knots = 11, cyclic = TRUE, 
                                      df = 3, boundary.knots = c(0.5, 12.5)), 
                  offset = "scalar", offset_control = o_control(k_min = 5), 
                  control = boost_control(mstop = 60), 
                  data = CanadianWeather) 
 
 ## Not run: 
##D                   
##D    #### find the optimal mstop over 5-fold bootstrap 
##D    ## using the function applyFolds 
##D    set.seed(123)
##D    folds3 <- cv(rep(1, length(unique(mod3$id))), B = 5)
##D    appl3 <- applyFolds(mod3, folds = folds3, grid = 1:200)
##D  
##D    ## use function cvrisk; be careful to do the resampling on the level of curves
##D    set.seed(123)
##D    folds3long <- cvLong(id = mod3$id, weights = model.weights(mod3), B = 5)
##D    cvm3 <- cvrisk(mod3, folds = folds3long, grid = 1:200)
##D    mstop(cvm3) ## mod3[64]
##D    
##D    summary(mod3)
##D    ## plot(mod3, pers = TRUE)
##D  
## End(Not run)
}

######## Example for functional response observed on irregular grid
######## Delete part of observations in viscosity data-set
data("viscosity", package = "FDboost")
## set time-interval that should be modeled
interval <- "101"

## model time until "interval" and take log() of viscosity
end <- which(viscosity$timeAll == as.numeric(interval))
viscosity$vis <- log(viscosity$visAll[,1:end])
viscosity$time <- viscosity$timeAll[1:end]
# with(viscosity, funplot(time, vis, pch = 16, cex = 0.2))

## only keep one eighth of the observation points
set.seed(123)
selectObs <- sort(sample(x = 1:(64*46), size = 64*46/4, replace = FALSE))
dataIrregular <- with(viscosity, list(vis = c(vis)[selectObs], 
                                      T_A = T_A, T_C = T_C,  
                                      time = rep(time, each = 64)[selectObs], 
                                      id = rep(1:64, 46)[selectObs]))

## fit median regression model with 50 boosting iterations,
## step-length 0.4 and smooth time-specific offset
## the factors are in effect coding -1, 1 for the levels
## no integration weights are used!
mod4 <- FDboost(vis ~ 1 + bols(T_C, contrasts.arg = "contr.sum", intercept = FALSE)
                + bols(T_A, contrasts.arg = "contr.sum", intercept=FALSE),
                timeformula = ~ bbs(time, lambda = 100), id = ~id, 
                numInt = "Riemann", family = QuantReg(),
                offset = NULL, offset_control = o_control(k_min = 9),
                data = dataIrregular, control = boost_control(mstop = 50, nu = 0.4))
## summary(mod4)
## plot(mod4)
## plotPredicted(mod4, lwdPred = 2)

## Not run: 
##D   ## Find optimal mstop, small grid/low B for a fast example
##D   set.seed(123)
##D   folds4 <- cv(rep(1, length(unique(mod4$id))), B = 3)
##D   appl4 <- applyFolds(mod4, folds = folds4, grid = 1:50)
##D   ## val4 <- validateFDboost(mod4, folds = folds4, grid = 1:50)
##D 
##D   set.seed(123)
##D   folds4long <- cvLong(id = mod4$id, weights = model.weights(mod4), B = 3)
##D   cvm4 <- cvrisk(mod4, folds = folds4long, grid = 1:50)
##D   mstop(cvm4)
## End(Not run)

## Be careful if you want to predict newdata with irregular response,  
## as the argument index is not considered in the prediction of newdata. 
## Thus, all covariates have to be repeated according to the number of observations 
## in each response trajectroy. 
## Predict four response curves with full time-observations 
## for the four combinations of T_A and T_C. 
newd <- list(T_A = factor(c(1,1,2,2), levels = 1:2, 
                        labels = c("low", "high"))[rep(1:4, length(viscosity$time))], 
             T_C = factor(c(1,2,1,2), levels = 1:2, 
                        labels = c("low", "high"))[rep(1:4, length(viscosity$time))], 
             time = rep(viscosity$time, 4))
             
pred <- predict(mod4, newdata = newd)
## funplot(x = rep(viscosity$time, 4), y = pred, id = rep(1:4, length(viscosity$time)))
                  
                



