library(geostatsp)


### Name: krigeLgm
### Title: Spatial prediction, or Kriging
### Aliases: krigeLgm

### ** Examples

data('swissRain')
swissRain$lograin = log(swissRain$rain)
swissRain[[names(swissAltitude)]] = extract(swissAltitude, swissRain)

if(interactive()  | Sys.info()['user'] =='patrick') {
swissFit = likfitLgm(data=swissRain, 
			formula=lograin~ CHE_alt,
			param=c(range=46500, nugget=0.05,shape=1,  
					anisoAngleDegrees=35, anisoRatio=12),
			paramToEstimate = c("range","nugget", 
				"anisoAngleDegrees", "anisoRatio")
)
myTrend = swissFit$model$formula
myParams = swissFit$param
dput(myParams)
# will give the following
} else {
myParams=structure(c(0.0951770829449953, 0.77308786208928, 49379.3845752436, 
1, 11.673076577513, 0.649925237653982, 1, 2.26103881494066, 0.000146945995279231, 
37.2379731166102), .Names = c("nugget", "variance", "range", 
"shape", "anisoRatio", "anisoAngleRadians", "boxcox", "(Intercept)", 
"CHE_alt", "anisoAngleDegrees"))
myTrend =lograin~ CHE_alt
}

# make sure krige can cope with missing values!
swissAltitude[1:50,1:50] = NA
swissKrige = krigeLgm(data=swissRain, 
	formula = myTrend,
	covariates = swissAltitude,  
	param=myParams,
	grid = 40, expPred=TRUE)



plot(swissKrige[["predict"]], main="predicted rain")
plot(swissBorder, add=TRUE)

# now with box cox and provide a raster for prediction, no covariates

if(interactive()  | Sys.info()['user'] =='patrick') {
swissFit2 = likfitLgm(
	data=swissRain, 
			formula=rain~1,
			param=c(range=52000, nugget=0.1,
			shape=1, boxcox=0.5,
					anisoAngleDegrees=35, anisoRatio=8),
			paramToEstimate = c("range","nugget", 
				"anisoAngleDegrees", "anisoRatio"),
			parscale = c(range=5000,nugget=0.01, 
				anisoRatio=1,anisoAngleDegrees=5)
)
myTrend2 = swissFit2$trend
myParams2 = swissFit2$param
dput(myParams2)
} else {
myParams2=structure(c(0.865530531647866, 8.76993204385615, 54143.5826959284, 
1, 7.36559089705556, 0.647158492167979, 0.5, 5.16254700135706, 
37.0794502772753), .Names = c("nugget", "variance", "range", 
"shape", "anisoRatio", "anisoAngleRadians", "boxcox", "(Intercept)", 
"anisoAngleDegrees"))
myTrend2=rain~1
}

swissRaster = raster(extent(swissBorder), nrows=25, ncols=40)


swissKrige2 = krigeLgm(data=swissRain, formula = myTrend2,
	  param=myParams2,
	grid = swissRaster)





plot(swissKrige2[["predict"]], main="predicted rain with box-cox")
plot(swissBorder, add=TRUE)







