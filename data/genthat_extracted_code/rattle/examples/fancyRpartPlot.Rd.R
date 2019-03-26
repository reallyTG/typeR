library(rattle)


### Name: fancyRpartPlot
### Title: A wrapper for plotting rpart trees using prp
### Aliases: fancyRpartPlot
### Keywords: hplot

### ** Examples

## Use rpart to build a decision tree.

## Not run: 
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
##D # Fit the model.
##D 
##D fit <- rpart(form, data=ds[train, vars])
##D 
##D ## Plot the model.
##D 
##D fancyRpartPlot(fit)
##D 
##D ## Choose different colours.
##D 
##D fancyRpartPlot(fit, palettes=c("Greys", "Oranges"))
##D 
##D ## Add a main title to the plot.
##D 
##D fancyRpartPlot(fit, main=target) 
##D 
## End(Not run)


