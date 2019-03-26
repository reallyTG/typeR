library(boostmtree)


### Name: vimpPlot
### Title: Variable Importance (VIMP) plot
### Aliases: vimpPlot
### Keywords: plot

### ** Examples

## Not run: 
##D ##------------------------------------------------------------
##D ## Synthetic example
##D ## high correlation, quadratic time with quadratic interaction
##D ##-------------------------------------------------------------
##D #simulate the data
##D dta <- simLong(n = 50, N = 5, rho =.80, model = 2)$dtaL
##D 
##D #basic boosting call
##D boost.grow <- boostmtree(dta$features, dta$time, dta$id, dta$y, M = 300,
##D               cv.flag = TRUE, importance = TRUE)
##D 
##D # VIMP plot
##D vimpPlot(object = boost.grow, ymaxlim = 20, ymaxtimelim = 20,
##D          xaxishead = c(3,3), yaxishead = c(65,65),
##D          cex.xlab = 1, subhead.cexval = 1.2)
## End(Not run)



