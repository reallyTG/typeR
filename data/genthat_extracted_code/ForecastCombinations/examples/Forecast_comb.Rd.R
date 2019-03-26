library(ForecastCombinations)


### Name: Forecast_comb
### Title: Forecasts combination using regression, robust regression,
###   constrained regression or variance based
### Aliases: Forecast_comb

### ** Examples

 library(MASS)
 tt <- NROW(Boston)/2
 TT <- NROW(Boston)
 y <- Boston[1:tt, 14] # dependent variable is columns number 14

 # Create two sets of explanatory variables
 x1 <- Boston[1:tt, 1:6] # The first 6 explanatories
 x2 <- Boston[1:tt, 7:13]# The last 6 explanatories

#create two forecasts based on the two different x1 and x2
 coef1 <- lm(y~as.matrix(x1))$coef
 coef2 <- lm(y~as.matrix(x2))$coef
 f1 <- t(coef1 %*% t(cbind(rep(1,tt), Boston[(tt+1):TT, 1:6] )))
 f2 <- t(coef2 %*% t(cbind(rep(1,tt), Boston[(tt+1):TT, 7:13] )))
 ff <- cbind(f1, f2)
scheme=c("simple", "ols", "robust", "variance based", "cls", "best")

example0 <- list()

 for ( i in 	scheme) {
 	example0[[i]] <- Forecast_comb(obs = Boston[(tt+1):TT, 14] ,
 	fhat = ff, Averaging_scheme = i)
 	cat(i, ":",  sqrt(mean((example0[[i]]$fitted - Boston[(tt+1):TT, 14] )^2)), "\n" )
 }

# Compare with
apply(ff, 2, function(x) {  sqrt(mean((x - Boston[(tt+1):TT, 14])^2)) }  )



