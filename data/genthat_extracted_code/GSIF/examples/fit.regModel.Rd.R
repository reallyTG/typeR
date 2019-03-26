library(GSIF)


### Name: fit.regModel-methods
### Title: Fits a regression model to spatial data
### Aliases: fit.regModel
###   fit.regModel,formula,data.frame,SpatialPixelsDataFrame,character-method

### ** Examples

library(sp)
library(rpart)
library(nlme)
library(gstat)
library(randomForest)
library(quantregForest)
library(xgboost)
library(caret)
library(scales)
library(AICcmodavg)

## load the Meuse data set:
demo(meuse, echo=FALSE)

## prepare the regression matrix:
ov <- over(meuse, meuse.grid)
ov <- cbind(data.frame(meuse["om"]), ov)
## skip variogram fitting:
m <- fit.regModel(om~dist+ffreq, rmatrix=ov, meuse.grid, 
    fit.family=gaussian(log), method="GLM", rvgm=NULL)
m@regModel
m@vgmModel
plot(m)
## fit a GLM with variogram:
m1 <- fit.regModel(om~dist+ffreq, rmatrix=ov, meuse.grid, 
    fit.family=gaussian(log), method="GLM")
m1@vgmModel
plot(m1)
rk1 <- predict(m1, meuse.grid)
plot(rk1)

## fit a regression tree with variogram:
m2 <- fit.regModel(log1p(om)~dist+ffreq, rmatrix=ov, meuse.grid,
     method="rpart")
plot(m2)
rk2 <- predict(m2, meuse.grid)
plot(rk2)

## fit a lme model with variogram:
m3 <- fit.regModel(log1p(om)~dist, rmatrix=ov, meuse.grid,
     method="lme", random=~1|ffreq)
plot(m3)
#rk3 <- predict(m3, meuse.grid)
#plot(rk3)

## fit a randomForest model with variogram
## NOTE: no transformation required
m4 <- fit.regModel(om~dist+ffreq, rmatrix=ov, meuse.grid,
     method="randomForest")
plot(m4)
rk4 <- predict(m4, meuse.grid)
plot(rk4)

## RF is very sensitive to the 'mtry' argument:
m4b <- fit.regModel(om~dist+ffreq, rmatrix=ov, meuse.grid,
     method="randomForest", mtry=2)
plot(m4b)

## Not run: 
##D ## RF with uncertainty (quantregForest package)
##D m5 <- fit.regModel(om~dist+ffreq, rmatrix=ov, meuse.grid,
##D      method="quantregForest")
##D plot(m5)
##D rk5 <- predict(m5, meuse.grid)
##D plot(rk5)
##D dev.off()
##D ## plot prediction error map:
##D spplot(rk5@predicted["var1.var"])
##D 
##D ## ranger
##D m6 <- fit.regModel(om~dist+ffreq, rmatrix=ov, meuse.grid,
##D      method="ranger", rvgm=NULL)
##D plot(m6)
##D rk6 <- predict(m6, meuse.grid)
##D plot(rk6)
##D 
##D ## XGBoost
##D m7 <- fit.regModel(om~dist+ffreq, rmatrix=ov, meuse.grid,
##D      method="xgboost", rvgm=NULL)
##D plot(m7)
##D rk7 <- predict(m7, meuse.grid)
##D plot(rk7)
## End(Not run)



