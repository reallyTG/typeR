library(CovSel)


### Name: cov.sel
### Title: Model-Free Selection of Covariate Sets
### Aliases: cov.sel

### ** Examples

## Marginal co-ordinate hypothesis test, continuous covariates only

data(datc)


##Algorithm A, keeping x6 and x7
  
ans <- cov.sel(T = datc$T, Y = datc$y, X = datc[,1:8], type="dr",
               alpha = 0.1, alg = 1, scope=c("x6","x7"))

summary(ans)

##Algorithm B, method "save"
  
ans <- cov.sel(T = datc$T, Y = datc$y, X = datc[,1:10], type="dr",
               alg = 2, method = "save", alpha = 0.3, na.action = "na.omit")

## Kernel-based smoothing, both categorical and continuous covariates

data(datfc)
##The example below with default setting takes about 9 minutes to run.
## ans <- cov.sel(T = datfc$T, Y = datfc$y, X = datfc[,1:8], type="np",
##               alpha = 0.1, alg = 3, scope=NULL, thru=0.5, thro=0.25, thrc=100)

## For illustration purposes we run Algorithm A using only the first 100 observations 
##and x1, x2, x3, x4 in datfc
ans <- cov.sel(T = datfc$T[1:100], Y = datfc$y[1:100], X = datfc[1:100,1:4], 
      type="np",alpha = 0.1, alg = 1, scope=NULL, thru=0.5, thro=0.25, thrc=100)

##The example below running Algorithm A, keeping x6 and x7 with regtype="ll"
##takes about 7 minutes to run.
##ans <- cov.sel(T = datfc$T, Y = datfc$y, X = datfc[,1:8], type="np",
##               alpha = 0.1, alg = 3, scope=c("x6","x7"), thru=0.5, thro=0.25, 
##               thrc=100, regtype="ll")




