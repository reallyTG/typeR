library(smooth)


### Name: ces
### Title: Complex Exponential Smoothing
### Aliases: ces
### Keywords: models nonlinear regression smooth ts univar

### ** Examples


y <- rnorm(100,10,3)
ces(y,h=20,holdout=TRUE)
ces(y,h=20,holdout=FALSE)

y <- 500 - c(1:100)*0.5 + rnorm(100,10,3)
ces(y,h=20,holdout=TRUE,intervals="p",bounds="a")

library("Mcomp")
y <- ts(c(M3$N0740$x,M3$N0740$xx),start=start(M3$N0740$x),frequency=frequency(M3$N0740$x))
ces(y,h=8,holdout=TRUE,seasonality="s",intervals="sp",level=0.8)

## Not run: 
##D y <- ts(c(M3$N1683$x,M3$N1683$xx),start=start(M3$N1683$x),frequency=frequency(M3$N1683$x))
##D ces(y,h=18,holdout=TRUE,seasonality="s",intervals="sp")
##D ces(y,h=18,holdout=TRUE,seasonality="p",intervals="np")
##D ces(y,h=18,holdout=TRUE,seasonality="f",intervals="p")
## End(Not run)

## Not run: 
##D x <- cbind(c(rep(0,25),1,rep(0,43)),c(rep(0,10),1,rep(0,58)))
##D ces(ts(c(M3$N1457$x,M3$N1457$xx),frequency=12),h=18,holdout=TRUE,
##D     intervals="np",xreg=x,cfType="TMSE")
## End(Not run)

# Exogenous variables in CES
## Not run: 
##D x <- cbind(c(rep(0,25),1,rep(0,43)),c(rep(0,10),1,rep(0,58)))
##D ces(ts(c(M3$N1457$x,M3$N1457$xx),frequency=12),h=18,holdout=TRUE,xreg=x)
##D ourModel <- ces(ts(c(M3$N1457$x,M3$N1457$xx),frequency=12),h=18,holdout=TRUE,xreg=x,updateX=TRUE)
##D # This will be the same model as in previous line but estimated on new portion of data
##D ces(ts(c(M3$N1457$x,M3$N1457$xx),frequency=12),model=ourModel,h=18,holdout=FALSE)
## End(Not run)

# Intermittent data example
x <- rpois(100,0.2)
# Best type of intermittent model based on iETS(Z,Z,N)
ourModel <- ces(x,intermittent="auto")

summary(ourModel)
forecast(ourModel)
plot(forecast(ourModel))




