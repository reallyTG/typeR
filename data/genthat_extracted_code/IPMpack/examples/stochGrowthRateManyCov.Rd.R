library(IPMpack)


### Name: stochGrowthRateManyCov
### Title: Estimates stochastic population growth rates (lambda_s) or
###   invasion rate with many varying covariates. Alternatively, tracks
###   population structure in a stochastic environment if trackStruct is
###   TRUE.
### Aliases: stochGrowthRateManyCov

### ** Examples


### NOT RUN - this is hashed out because compiles too slowly ###

# Generate relevant data, build objects
#dff <- generateData(type="stochastic")
#print(head(dff))
#gr1 <- makeGrowthObj(dff, Formula = sizeNext~size+size2+covariate1)
#sv1 <- makeSurvObj(dff, Formula = surv~size+size2+covariate2)
#fv1 <- makeFecObj(dff, Formula = fec~size+size2,Transform="log")

# Generate time series of covariates for which population growth rate 
#is required. Here set to be seasonal environment. 
#Names of covariates must be same as in dff
#tVals <- seq(1,100,by = 1/12)
#covTest <- (1 + 0.5*sin(2*pi*tVals))
#covMatTest <- data.frame(covariate1 = rnorm(length(covTest),covTest,0.5) - 1, 
#covariate2 = rnorm(length(covTest), covTest,0.5) - 1, 
#covariate3 = rnorm(length(covTest), covTest,0.5) - 1, row.names = NULL)

# Calculate

#r <- stochGrowthRateManyCov(covariate = covMatTest, nRunIn = 5*10, 
#tMax = length(tVals), growthObj = gr1, survObj = sv1, fecObj = fv1, 
#nBigMatrix = 100, 
#minSize = 1.1*min(dff$size, na.rm = TRUE), 
#maxSize = 1.1*max(dff$size, na.rm = TRUE), nMicrosites = 0)

#r

# Track population strucuture instead
#st <- stochGrowthRateManyCov(covariate = covMatTest, nRunIn = 5*10, 
#tMax = length(tVals), growthObj = gr1, survObj = sv1, fecObj = fv1, 
#nBigMatrix = 100, 
#minSize = 1.1*min(dff$size, na.rm = TRUE), 
#maxSize = 1.1*max(dff$size, na.rm = TRUE), nMicrosites = 0, 
#trackStruct=TRUE,plot=TRUE)





