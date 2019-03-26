library(FDboost)


### Name: applyFolds
### Title: Cross-Validation and Bootstrapping over Curves
### Aliases: applyFolds cvMa cvLong cvrisk.FDboost cvrisk.FDboost cvLong
###   cvMa

### ** Examples

Ytest <- matrix(rnorm(15), ncol = 3) # 5 trajectories, each with 3 observations 
Ylong <- as.vector(Ytest)
## 4-folds for bootstrap for the response in long format without integration weights
cvMa(ydim = c(5,3), type = "bootstrap", B = 4)  
cvLong(id = rep(1:5, times = 3), type = "bootstrap", B = 4)

if(require(fda)){
 ## load the data
 data("CanadianWeather", package = "fda")
 
 ## use data on a daily basis 
 canada <- with(CanadianWeather, 
                list(temp = t(dailyAv[ , , "Temperature.C"]),
                     l10precip = t(dailyAv[ , , "log10precip"]),
                     l10precip_mean = log(colMeans(dailyAv[ , , "Precipitation.mm"]), base = 10),
                     lat = coordinates[ , "N.latitude"],
                     lon = coordinates[ , "W.longitude"],
                     region = factor(region),
                     place = factor(place),
                     day = 1:365,  ## corresponds to t: evaluation points of the fun. response 
                     day_s = 1:365))  ## corresponds to s: evaluation points of the fun. covariate
 
## center temperature curves per day 
canada$tempRaw <- canada$temp
canada$temp <- scale(canada$temp, scale = FALSE) 
rownames(canada$temp) <- NULL ## delete row-names 
  
## fit the model  
mod <- FDboost(l10precip ~ 1 + bolsc(region, df = 4) + 
                 bsignal(temp, s = day_s, cyclic = TRUE, boundary.knots = c(0.5, 365.5)), 
               timeformula = ~ bbs(day, cyclic = TRUE, boundary.knots = c(0.5, 365.5)), 
               data = canada)
mod <- mod[75]

## Not run: 
##D   #### create folds for 3-fold bootstrap: one weight for each curve
##D   set.seed(123)
##D   folds_bs <- cv(weights = rep(1, mod$ydim[1]), type = "bootstrap", B = 3)
##D 
##D   ## compute out-of-bag risk on the 3 folds for 1 to 75 boosting iterations  
##D   cvr <- applyFolds(mod, folds = folds_bs, grid = 1:75)
##D 
##D   ## weights per observation point  
##D   folds_bs_long <- folds_bs[rep(1:nrow(folds_bs), times = mod$ydim[2]), ]
##D   attr(folds_bs_long, "type") <- "3-fold bootstrap"
##D   ## compute out-of-bag risk on the 3 folds for 1 to 75 boosting iterations  
##D   cvr3 <- cvrisk(mod, folds = folds_bs_long, grid = 1:75)
## End(Not run)

## Not run: 
##D   ## plot the out-of-bag risk
##D   par(mfrow = c(1,3))
##D   plot(cvr); legend("topright", lty=2, paste(mstop(cvr)))
##D   plot(cvr3); legend("topright", lty=2, paste(mstop(cvr3)))
## End(Not run)

}




