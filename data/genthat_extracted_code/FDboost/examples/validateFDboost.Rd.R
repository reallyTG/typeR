library(FDboost)


### Name: validateFDboost
### Title: Cross-Validation and Bootstrapping over Curves
### Aliases: validateFDboost

### ** Examples

## Not run: 
##D if(require(fda)){
##D  ## load the data
##D  data("CanadianWeather", package = "fda")
##D  
##D  ## use data on a daily basis 
##D  canada <- with(CanadianWeather, 
##D                 list(temp = t(dailyAv[ , , "Temperature.C"]),
##D                      l10precip = t(dailyAv[ , , "log10precip"]),
##D                      l10precip_mean = log(colMeans(dailyAv[ , , "Precipitation.mm"]), base = 10),
##D                      lat = coordinates[ , "N.latitude"],
##D                      lon = coordinates[ , "W.longitude"],
##D                      region = factor(region),
##D                      place = factor(place),
##D                      day = 1:365,  ## corresponds to t: evaluation points of the fun. response 
##D                      day_s = 1:365))  ## corresponds to s: evaluation points of the fun. covariate
##D  
##D ## center temperature curves per day 
##D canada$tempRaw <- canada$temp
##D canada$temp <- scale(canada$temp, scale = FALSE) 
##D rownames(canada$temp) <- NULL ## delete row-names 
##D   
##D ## fit the model  
##D mod <- FDboost(l10precip ~ 1 + bolsc(region, df = 4) + 
##D                  bsignal(temp, s = day_s, cyclic = TRUE, boundary.knots = c(0.5, 365.5)), 
##D                timeformula = ~ bbs(day, cyclic = TRUE, boundary.knots = c(0.5, 365.5)), 
##D                data = canada)
##D mod <- mod[75]
##D 
##D   #### create folds for 3-fold bootstrap: one weight for each curve
##D   set.seed(123)
##D   folds_bs <- cv(weights = rep(1, mod$ydim[1]), type = "bootstrap", B = 3)
##D 
##D   ## compute out-of-bag risk on the 3 folds for 1 to 75 boosting iterations  
##D   cvr <- applyFolds(mod, folds = folds_bs, grid = 1:75)
##D 
##D   ## compute out-of-bag risk and coefficient estimates on folds  
##D   cvr2 <- validateFDboost(mod, folds = folds_bs, grid = 1:75)
##D 
##D   ## weights per observation point  
##D   folds_bs_long <- folds_bs[rep(1:nrow(folds_bs), times = mod$ydim[2]), ]
##D   attr(folds_bs_long, "type") <- "3-fold bootstrap"
##D   ## compute out-of-bag risk on the 3 folds for 1 to 75 boosting iterations  
##D   cvr3 <- cvrisk(mod, folds = folds_bs_long, grid = 1:75)
##D 
##D   ## plot the out-of-bag risk
##D   par(mfrow = c(1,3))
##D   plot(cvr); legend("topright", lty=2, paste(mstop(cvr)))
##D   plot(cvr2)
##D   plot(cvr3); legend("topright", lty=2, paste(mstop(cvr3)))
##D 
##D   ## plot the estimated coefficients per fold
##D   ## more meaningful for higher number of folds, e.g., B = 100 
##D   par(mfrow = c(2,2))
##D   plotPredCoef(cvr2, terms = FALSE, which = 2)
##D   plotPredCoef(cvr2, terms = FALSE, which = 3)
##D   
##D   ## compute out-of-bag risk and predictions for leaving-one-curve-out cross-validation
##D   cvr_jackknife <- validateFDboost(mod, folds = cvLong(unique(mod$id), 
##D                                    type = "curves"), grid = 1:75)
##D   plot(cvr_jackknife)
##D   ## plot oob predictions per fold for 3rd effect 
##D   plotPredCoef(cvr_jackknife, which = 3) 
##D   ## plot coefficients per fold for 2nd effect
##D   plotPredCoef(cvr_jackknife, which = 2, terms = FALSE)
##D 
##D }
## End(Not run)




