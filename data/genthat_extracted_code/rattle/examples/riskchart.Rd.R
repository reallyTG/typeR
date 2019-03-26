library(rattle)


### Name: riskchart
### Title: Plot a risk chart
### Aliases: riskchart
### Keywords: hplot

### ** Examples

## Not run: 
##D 
##D ## Use rpart to build a decision tree.
##D 
##D library(rpart)
##D 
##D ## Set up the data for modelling.
##D 
##D set.seed(42)
##D ds     <- weather
##D target <- "RainTomorrow"
##D risk   <- "RISK_MM"
##D ignore <- c("Date", "Location", risk)
##D vars   <- setdiff(names(ds), ignore)
##D nobs   <- nrow(ds)
##D form   <- formula(paste(target, "~ ."))
##D train  <- sample(nobs, 0.7*nobs)
##D test   <- setdiff(seq_len(nobs), train)
##D actual <- ds[test, target]
##D risks  <- ds[test, risk]
##D 
##D # Build the model.
##D 
##D model <- rpart(form, data=ds[train, vars])
##D 
##D ## Obtain predictions.
##D 
##D predicted <- predict(model, ds[test, vars], type="prob")[,2]
##D 
##D ## Plot the Risk Chart.
##D 
##D riskchart(predicted, actual, risks)
## End(Not run)



