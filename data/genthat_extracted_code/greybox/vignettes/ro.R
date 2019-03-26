## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

library(greybox)

## ----out.width="75%", echo=FALSE-----------------------------------------
# All defaults
knitr::include_graphics("./img/ROProcessCO.gif")

## ----out.width="75%", echo=FALSE-----------------------------------------
# All defaults
knitr::include_graphics("./img/ROProcessNoCO.gif")

## ----out.width="75%", echo=FALSE-----------------------------------------
# All defaults
knitr::include_graphics("./img/ROProcessCOCI.gif")

## ------------------------------------------------------------------------
x <- rnorm(100,100,10)

## ------------------------------------------------------------------------
ourCall <- "predict(arima(x=data,order=c(0,1,1)),n.ahead=h)"

## ------------------------------------------------------------------------
ourValue <- "pred"

## ------------------------------------------------------------------------
returnedValues1 <- ro(x, h=3, origins=8, call=ourCall, value=ourValue)

## ------------------------------------------------------------------------
apply(abs(returnedValues1$holdout - returnedValues1$pred),1,mean,na.rm=TRUE) / mean(returnedValues1$actuals)

## ---- fig.height = 4, fig.width = 6--------------------------------------
plot(returnedValues1)

## ------------------------------------------------------------------------
returnedValues1$holdout

## ------------------------------------------------------------------------
returnedValues2 <- ro(x, h=3, origins=8, call=ourCall, value=ourValue, ci=TRUE, co=TRUE)

## ---- fig.height = 4, fig.width = 6--------------------------------------
plot(returnedValues2)

## ------------------------------------------------------------------------
ourCallETS <- "forecast(ets(data),h=h,level=95)"
ourValueETS <- c("mean","lower","upper")

## ------------------------------------------------------------------------
x <- matrix(rnorm(120*3,c(100,50,150),c(10,5,15)), 120, 3, byrow=TRUE)

## ------------------------------------------------------------------------
ourForecasts <- array(NA,c(3,2,3,8))

## ------------------------------------------------------------------------
ourModels <- list(c(0,1,1), c(1,1,0))

## ------------------------------------------------------------------------
ourCall <- "predict(arima(data, order=ourModels[[i]]), n.ahead=h)"

## ------------------------------------------------------------------------
ourHoldoutValues <- array(NA,c(3,3,8))

## ------------------------------------------------------------------------
for(j in 1:3){
    for(i in 1:2){
        ourdata <- x[,j]
        ourROReturn <- ro(data=ourdata, h=3, origins=8, call=ourCall,
                          value=ourValue, co=TRUE)
        ourForecasts[j,i,,] <- ourROReturn$pred
    }
    ourHoldoutValues[j,,] <- ourROReturn$holdout
}

## ------------------------------------------------------------------------
exp(mean(log(apply(abs(ourHoldoutValues - ourForecasts[,1,,]),1,mean,na.rm=TRUE) / apply(abs(ourHoldoutValues - ourForecasts[,2,,]),1,mean,na.rm=TRUE))))

## ------------------------------------------------------------------------
xreg <- matrix(rnorm(120*3,c(100,50,150),c(10,5,15)), 120, 3, byrow=TRUE)
y <- 0.5*xreg[,1] + 0.2*xreg[,2] + 0.75*xreg[,3] + rnorm(120,0,10)
xreg <- cbind(y,xreg)
colnames(xreg) <- c("y",paste0("x",c(1:3)))
xreg <- as.data.frame(xreg)

## ------------------------------------------------------------------------
ourCall <- "predict(lm(y~x1+x2+x3,xreg[counti,]),newdata=xreg[counto,],interval='p')"

## ------------------------------------------------------------------------
ourROReturn <- ro(y, h=3, origins=8, call=ourCall, ci=TRUE, co=TRUE)

## ------------------------------------------------------------------------
xreg <- matrix(rnorm(120*3,c(100,50,150),c(10,5,15)), 120, 3, byrow=TRUE)
y <- 0.5*xreg[,1] + 0.2*xreg[,2] + 0.75*xreg[,3] + rnorm(120,0,10)
colnames(xreg) <- paste0("x",c(1:3))
xreg <- as.data.frame(xreg)

## ------------------------------------------------------------------------
ourCall <- "predict(arima(x=data, order=c(0,1,1), xreg=xreg[counti,]), n.ahead=h, newxreg=xreg[counto,])"

## ------------------------------------------------------------------------
ourValue <- "pred"

## ------------------------------------------------------------------------
ourROReturn <- ro(x, h=3, origins=8, call=ourCall, value=ourValue)

## ------------------------------------------------------------------------
ourCall <- "es(x=data, xreg=xreg[countf,]), h=h)"

