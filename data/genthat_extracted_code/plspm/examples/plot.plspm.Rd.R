library(plspm)


### Name: plot.plspm
### Title: Plots for PLS Path Models
### Aliases: plot.plspm

### ** Examples

## Not run: 
##D  ## typical example of PLS-PM in customer satisfaction analysis
##D  ## model with six LVs and reflective indicators
##D  # load data satisfaction
##D  data(satisfaction)
##D 
##D  # define inner model matrix
##D  IMAG = c(0,0,0,0,0,0)
##D  EXPE = c(1,0,0,0,0,0)
##D  QUAL = c(0,1,0,0,0,0)
##D  VAL = c(0,1,1,0,0,0)
##D  SAT = c(1,1,1,1,0,0)
##D  LOY = c(1,0,0,0,1,0)
##D  sat.inner = rbind(IMAG, EXPE, QUAL, VAL, SAT, LOY)
##D 
##D  # define outer model list
##D  sat.outer = list(1:5, 6:10, 11:15, 16:19, 20:23, 24:27)
##D 
##D  # define vector of reflective modes
##D  sat.mod = rep("A", 6)
##D 
##D  # apply plspm
##D  satpls = plspm(satisfaction, sat.inner, sat.outer, sat.mod, scheme="centroid",
##D                scaled=FALSE)
##D 
##D  # plot path coefficients
##D  plot(satpls, what="inner")
##D 
##D  # plot loadings
##D  plot(satpls, what="loadings")
##D 
##D  # plot outer weights
##D  plot(satpls, what="weights")
##D  
## End(Not run)



