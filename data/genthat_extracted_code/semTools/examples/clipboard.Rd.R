library(semTools)


### Name: clipboard
### Title: Copy or save the result of 'lavaan' or 'FitDiff' objects into a
###   clipboard or a file
### Aliases: clipboard saveFile

### ** Examples


## Not run: 
##D library(lavaan)
##D HW.model <- ' visual  =~ x1 + c1*x2 + x3
##D               textual =~ x4 + c1*x5 + x6
##D                speed   =~ x7 + x8 + x9 '
##D 
##D fit <- cfa(HW.model, data=HolzingerSwineford1939, group="school", meanstructure=TRUE)
##D 
##D # Copy the summary of the lavaan object
##D clipboard(fit)
##D 
##D # Copy the modification indices and the model fit from the miPowerFit function
##D clipboard(fit, "mifit")
##D 
##D # Copy the parameter estimates
##D clipboard(fit, "coef")
##D 
##D # Copy the standard errors
##D clipboard(fit, "se")
##D 
##D # Copy the sample statistics
##D clipboard(fit, "samp")
##D 
##D # Copy the fit measures
##D clipboard(fit, "fit")
##D 
##D # Save the summary of the lavaan object
##D saveFile(fit, "out.txt")
##D 
##D # Save the modification indices and the model fit from the miPowerFit function
##D saveFile(fit, "out.txt", "mifit")
##D 
##D # Save the parameter estimates
##D saveFile(fit, "out.txt", "coef")
##D 
##D # Save the standard errors
##D saveFile(fit, "out.txt", "se")
##D 
##D # Save the sample statistics
##D saveFile(fit, "out.txt", "samp")
##D 
##D # Save the fit measures
##D saveFile(fit, "out.txt", "fit")
## End(Not run)




