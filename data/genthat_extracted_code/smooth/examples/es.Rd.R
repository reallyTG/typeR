library(smooth)


### Name: es
### Title: Exponential Smoothing in SSOE state space model
### Aliases: es
### Keywords: models nonlinear regression smooth ts univar

### ** Examples


library(Mcomp)

# See how holdout and trace parameters influence the forecast
es(M3$N1245$x,model="AAdN",h=8,holdout=FALSE,cfType="MSE")
## Not run: es(M3$N2568$x,model="MAM",h=18,holdout=TRUE,cfType="TMSE")

# Model selection example
es(M3$N1245$x,model="ZZN",ic="AIC",h=8,holdout=FALSE,bounds="a")

# Model selection. Compare AICc of these two models:
## Not run: 
##D es(M3$N1683$x,"ZZZ",h=10,holdout=TRUE)
##D es(M3$N1683$x,"MAdM",h=10,holdout=TRUE)
## End(Not run)

# Model selection, excluding multiplicative trend
## Not run: es(M3$N1245$x,model="ZXZ",h=8,holdout=TRUE)

# Combination example
## Not run: es(M3$N1245$x,model="CCN",h=8,holdout=TRUE)

# Model selection using a specified pool of models
ourModel <- es(M3$N1587$x,model=c("ANN","AAM","AMdA"),h=18)

# Redo previous model and produce prediction intervals
es(M3$N1587$x,model=ourModel,h=18,intervals="p")

# Semiparametric intervals example
## Not run: es(M3$N1587$x,h=18,holdout=TRUE,intervals="sp")

# Exogenous variables in ETS example
## Not run: 
##D x <- cbind(c(rep(0,25),1,rep(0,43)),c(rep(0,10),1,rep(0,58)))
##D y <- ts(c(M3$N1457$x,M3$N1457$xx),frequency=12)
##D es(y,h=18,holdout=TRUE,xreg=x,cfType="aTMSE",intervals="np")
##D ourModel <- es(ts(c(M3$N1457$x,M3$N1457$xx),frequency=12),h=18,holdout=TRUE,xreg=x,updateX=TRUE)
## End(Not run)

# This will be the same model as in previous line but estimated on new portion of data
## Not run: es(ts(c(M3$N1457$x,M3$N1457$xx),frequency=12),model=ourModel,h=18,holdout=FALSE)

# Intermittent data example
x <- rpois(100,0.2)
# Intervals-based model (Croston's method) with the best ETS for demand sizes
es(x,"ZZN",intermittent="i")
# Intervals-based model (TSB) on iETS(M,N,N)
es(x,"MNN",intermittent="p")
# Constant probability based on iETS(M,N,N)
es(x,"MNN",intermittent="fixed")
# Best type of intermittent model based on iETS(Z,Z,N)
ourModel <- es(x,"ZZN",intermittent="auto")

summary(ourModel)
forecast(ourModel)
plot(forecast(ourModel))




