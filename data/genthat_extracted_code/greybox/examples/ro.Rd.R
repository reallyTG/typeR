library(greybox)


### Name: ro
### Title: Rolling Origin
### Aliases: ro
### Keywords: ts

### ** Examples


x <- rnorm(100,0,1)
ourCall <- "predict(arima(x=data,order=c(0,1,1)),n.ahead=h)"

# The default call and values
ourValue <- "pred"
ourRO <- ro(x, h=5, origins=5, ourCall, ourValue)

# We can now plot the results of this evaluation:
plot(ourRO)

# You can also use dolar sign
ourValue <- "$pred"
# And you can have constant in-sample size
ro(x, h=5, origins=5, ourCall, ourValue, ci=TRUE)

# You can ask for several values
ourValue <- c("pred","se")
# And you can have constant holdout size
ro(x, h=5, origins=20, ourCall, ourValue, ci=TRUE, co=TRUE)

#### The following code will give exactly the same result as above,
#### but computed in parallel using all but 1 core of CPU:
## Not run: ro(x, h=5, origins=20, ourCall, ourValue, ci=TRUE, co=TRUE, parallel=TRUE)

#### If you want to use functions from forecast package, please note that you need to
#### set the values that need to be returned explicitly. There are two options for this.
# Example 1:
## Not run: 
##D ourCall <- "forecast(ets(data), h=h, level=95)"
##D ourValue <- c("mean", "lower", "upper")
##D ro(x,h=5,origins=5,ourCall,ourValue)
## End(Not run)

# Example 2:
## Not run: 
##D ourCall <- "forecast(ets(data), h=h, level=c(80,95))"
##D ourValue <- c("mean", "lower[,1]", "upper[,1]", "lower[,2]", "upper[,2]")
##D ro(x,h=5,origins=5,ourCall,ourValue)
## End(Not run)

#### A more complicated example using the for loop and
#### several time series
x <- matrix(rnorm(120*3,0,1), 120, 3)

## Form an array for the forecasts we will produce
## We will have 4 origins with 6-steps ahead forecasts
ourForecasts <- array(NA,c(6,4,3))

## Define models that need to be used for each series
ourModels <- list(c(0,1,1), c(0,0,1), c(0,1,0))

## This call uses specific models for each time series
ourCall <- "predict(arima(data, order=ourModels[[i]]), n.ahead=h)"
ourValue <- "pred"

## Start the loop. The important thing here is to use the same variable 'i' as in ourCall.
for(i in 1:3){
    ourdata <- x[,i]
    ourForecasts[,,i] <- ro(data=ourdata,h=6,origins=4,call=ourCall,
                            value=ourValue,co=TRUE,silent=TRUE)$pred
}

## ourForecasts array now contains rolling origin forecasts from specific
## models.

##### An example with exogenous variables
x <- rnorm(100,0,1)
xreg <- rnorm(100,0,1)

## 'counti' is used to define in-sample size of xreg,
## 'counto' - the size of the holdout sample of xreg

ourCall <- "predict(arima(x=data, order=c(0,1,1), xreg=xreg[counti]),
            n.ahead=h, newxreg=xreg[counto])"
ourValue <- "pred"
ro(x,h=5,origins=5,ourCall,ourValue)


## 'countf' is used to take xreg of the size corresponding to the whole
## sample on each iteration
## This is useful when working with functions from smooth package.
## The following call will return the forecasts from es() function of smooth.
## Not run: 
##D ourCall <- "es(data=data, h=h, xreg=xreg[countf])"
##D ourValue <- "forecast"
##D ro(x,h=5,origins=5,ourCall,ourValue)
## End(Not run)




