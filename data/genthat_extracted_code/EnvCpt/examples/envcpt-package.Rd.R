library(EnvCpt)


### Name: EnvCpt-package
### Title: Detection of Structural Changes in Climate and Environment Time
###   Series
### Aliases: EnvCpt-package EnvCpt
### Keywords: changepoint segmentation environment climate

### ** Examples

## Not run: 
##D set.seed(1)
##D x=c(rnorm(100,0,1),rnorm(100,5,1))
##D out=envcpt(x) # run all models with default values
##D out[[1]] # first row is twice the negative log-likelihood for each model
##D          # second row is the number of parameters
##D AIC(out) # returns AIC for each model.
##D which.min(AIC(out)) # gives meancpt (model 2) as the best model fit.
##D out$meancpt # gives the model fit for the meancpt model.
##D AICweights(out) # gives the AIC weights for each model
##D BIC(out) # returns the BIC for each model.
##D which.min(BIC(out)) # gives meancpt (model 2) as the best model fit too.
##D plot(out,type='fit') # plots the fits
##D plot(out,type="aic") # plots the aic values
##D plot(out,type="bic") # plots the bic values
##D 
##D set.seed(10)
##D x=c(0.01*(1:100),1.5-0.02*((101:250)-101))+rnorm(250,0,0.2)
##D out=envcpt(x,minseglen=10) # run all models with a minimum of 10 observations between changes
##D AIC(out) # returns the AIC for each model
##D which.min(AIC(out)) # gives trendcpt (model 8) as the best model fit.
##D out$trendcpt # gives the model fit for the trendcpt model.
##D AICweights(out) # gives the AIC weights for each model
##D BIC(out) # returns the BIC for each model.
##D which.min(BIC(out)) # gives trendcpt (model 8) as the best model fit too.
##D plot(out,type='fit') # plots the fits
##D plot(out,type="aic") # plots the aic values
##D plot(out,type="bic") # plots the bic values
##D 
##D set.seed(100)
##D x=arima.sim(model=list(ar=c(0.7,0.2)),n=500)+0.01*(1:500)
##D out=envcpt(x,models=c(3:6,9:12)) # runs a subset of models (those with AR components) 
##D AIC(out) # returns the AIC for each model
##D which.min(AIC(out)) # gives trendar2 (model 10) as the best model fit.
##D out$trendar2 # gives the model fit for the trendar2 model. Notice that the trend is tiny but does 
##D # produce a significantly better fit than the meanar2 model.
##D AICweights(out) # gives the AIC weights for each model
##D BIC(out) # returns the BIC for each model.
##D which.min(BIC(out)) # best fit is trendar2 (model 10) again.
##D plot(out,type='fit') # plots the fits
##D plot(out,type="aic") # plots the aic values
##D plot(out,type="bic") # plots the bic values
## End(Not run)



