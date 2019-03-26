library(smooth)


### Name: gum
### Title: Generalised Univariate Model
### Aliases: gum ges
### Keywords: models nonlinear regression smooth ts univar

### ** Examples


# Something simple:
gum(rnorm(118,100,3),orders=c(1),lags=c(1),h=18,holdout=TRUE,bounds="a",intervals="p")

# A more complicated model with seasonality
## Not run: ourModel <- gum(rnorm(118,100,3),orders=c(2,1),lags=c(1,4),h=18,holdout=TRUE)

# Redo previous model on a new data and produce prediction intervals
## Not run: gum(rnorm(118,100,3),model=ourModel,h=18,intervals="sp")

# Produce something crazy with optimal initials (not recommended)
## Not run: gum(rnorm(118,100,3),orders=c(1,1,1),lags=c(1,3,5),h=18,holdout=TRUE,initial="o")

# Simpler model estiamted using trace forecast error cost function and its analytical analogue
## Not run: 
##D gum(rnorm(118,100,3),orders=c(1),lags=c(1),h=18,holdout=TRUE,bounds="n",cfType="TMSE")
##D gum(rnorm(118,100,3),orders=c(1),lags=c(1),h=18,holdout=TRUE,bounds="n",cfType="aTMSE")
## End(Not run)

# Introduce exogenous variables
## Not run: gum(rnorm(118,100,3),orders=c(1),lags=c(1),h=18,holdout=TRUE,xreg=c(1:118))

# Ask for their update
## Not run: gum(rnorm(118,100,3),orders=c(1),lags=c(1),h=18,holdout=TRUE,xreg=c(1:118),updateX=TRUE)

# Do the same but now let's shrink parameters...
## Not run: 
##D gum(rnorm(118,100,3),orders=c(1),lags=c(1),h=18,xreg=c(1:118),updateX=TRUE,cfType="TMSE")
##D ourModel <- gum(rnorm(118,100,3),orders=c(1),lags=c(1),h=18,holdout=TRUE,cfType="aTMSE")
## End(Not run)

# Or select the most appropriate one
## Not run: 
##D gum(rnorm(118,100,3),orders=c(1),lags=c(1),h=18,holdout=TRUE,xreg=c(1:118),xregDo="s")
##D 
##D summary(ourModel)
##D forecast(ourModel)
##D plot(forecast(ourModel))
## End(Not run)




