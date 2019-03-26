library(plsdepot)


### Name: plot.plsreg2
### Title: Plot PLS-R2 basic results
### Aliases: plot.plsreg2

### ** Examples

## Not run: 
##D  # load dataset vehicles
##D  data(vehicles)
##D 
##D  # apply plsreg2
##D  pls2 = plsreg2(vehicles[,1:12], vehicles[,13:16])
##D 
##D  # plot variables (circle of correlations)
##D  plot(pls2, what="variables")
##D 
##D  # plot observations (as points)
##D  plot(pls2, what="observations")
##D 
##D  # plot observations with labels
##D  plot(pls2, what="observations", show.names=TRUE)
##D  
## End(Not run)



