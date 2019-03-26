library(gamclass)


### Name: gamRF
### Title: Random forest fit to residuals from GAM model
### Aliases: gamRF
### Keywords: models regression

### ** Examples

if(length(find.package("sp", quiet=TRUE))>0){
data("meuse", package="sp")
meuse <- within(meuse, {levels(soil) <- c("1","2","2")
                        ffreq <- as.numeric(ffreq)
                        loglead <- log(lead)}
)
form <- ~ dist + elev + ffreq + soil
rfVars <- c("dist", "elev", "soil", "ffreq", "x", "y")
## Select 90 out of 155 rows
sub <- sample(1:nrow(meuse), 90)
meuseOut <- meuse[-sub,]
meuseIn <- meuse[sub,]
gamRF(formlist=list("lm"=form), yvar="loglead", rfVars=rfVars,
                    data=meuseIn, newdata=meuseOut)
}

## The function is currently defined as
function (formlist, yvar, data, newdata = NULL, rfVars, method = "GCV.Cp", 
    printit = TRUE, seed = NULL) 
{   if(!is.null(seed))set.seed(seed)
    errRate <- numeric(length(formlist)+2)
    names(errRate) <- c(names(formlist), "rfTest", "rfOOB")
    ytrain <- data[, yvar]
    xtrain <- data[, rfVars]
    xtest <- newdata[, rfVars]
    ytest = newdata[, yvar]
    res.rf <- randomForest(x = xtrain, y = ytrain, 
                           xtest=xtest, 
                           ytest=ytest)
    errRate["rfOOB"] <- mean(res.rf$mse)
    errRate["rfTest"] <- mean(res.rf$test$mse)    
    GAMhat <- numeric(nrow(data))
    for(nam in names(formlist)){
      form <- as.formula(paste(c(yvar, paste(formlist[[nam]])), collapse=" "))
      train.gam <- gam(form, data = data, method = method)
      res <- resid(train.gam)
      cvGAMms <- sum(res^2)/length(res)
      if (!all(rfVars %in% names(newdata))) {
        missNam <- rfVars[!(rfVars %in% names(newdata))]
        stop(paste("The following were not found in 'newdata':", 
                   paste(missNam, collapse = ", ")))
      }
      GAMtesthat <- predict(train.gam, newdata = newdata)
      GAMtestres <- ytest - GAMtesthat
      Gres.rf <- randomForest(x = xtrain, y = res, xtest = xtest, 
                              ytest = GAMtestres)
      errRate[nam] <- mean(Gres.rf$test$mse)
    }
    if (printit) 
        print(round(errRate, 4))
    invisible(errRate)
}



