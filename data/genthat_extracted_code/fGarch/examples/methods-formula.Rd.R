library(fGarch)


### Name: formula-methods
### Title: Extract GARCH Model formula
### Aliases: formula-methods formula,ANY-method formula,fGARCH-method
### Keywords: models

### ** Examples

## garchFit -
   fit = garchFit(~garch(1, 1), data = garchSim())
   
## formula - 
   formula(fit)

## A Bivariate series and mis-specified formula:
   x = garchSim(n = 500)
   y = garchSim(n = 500)
   z = cbind(x, y)
   colnames(z)
   class(z)
   ## Not run: 
##D    garchFit(z ~garch(1, 1), data = z, trace = FALSE)
##D    
## End(Not run)
   # Returns:
   # Error in .garchArgsParser(formula = formula, data = data, trace = FALSE) :  
   #   Formula and data units do not match.
   
## Doubled column names in data set - formula can't fit:
   colnames(z) <- c("x", "x")
   z[1:6,]
   ## Not run: 
##D    garchFit(x ~garch(1, 1), data = z, trace = FALSE)
##D    
## End(Not run)
   # Again the error will be noticed:
   # Error in garchFit(x ~ garch(1, 1), data = z) : 
   #   Column names of data are not unique.

## Missing column names in data set - formula can't fit:
   z.mat <- as.matrix(z)
   colnames(z.mat) <- NULL
   z.mat[1:6,]
   ## Not run: 
##D    garchFit(x ~ garch(1, 1), data = z.mat, trace = FALSE)
##D    
## End(Not run)
   # Again the error will be noticed:
   # Error in .garchArgsParser(formula = formula, data = data, trace = FALSE) : 
   #   Formula and data units do not match



