library(plspm)


### Name: plspm.fit
### Title: Basic results for Partial Least Squares Path Modeling
### Aliases: plspm.fit

### ** Examples

## Not run: 
##D  ## typical example of PLS-PM in customer satisfaction analysis
##D  ## model with six LVs and reflective indicators
##D 
##D  # load dataset satisfaction
##D  data(satisfaction)
##D 
##D  # inner model matrix
##D  IMAG = c(0,0,0,0,0,0)
##D  EXPE = c(1,0,0,0,0,0)
##D  QUAL = c(0,1,0,0,0,0)
##D  VAL = c(0,1,1,0,0,0)
##D  SAT = c(1,1,1,1,0,0)
##D  LOY = c(1,0,0,0,1,0)
##D  sat_path = rbind(IMAG, EXPE, QUAL, VAL, SAT, LOY)
##D 
##D  # outer model list
##D  sat_blocks = list(1:5, 6:10, 11:15, 16:19, 20:23, 24:27)
##D 
##D  # vector of reflective modes
##D  sat_modes = rep("A", 6)
##D 
##D  # apply plspm.fit
##D  satpls = plspm.fit(satisfaction, sat_path, sat_blocks, sat_modes,
##D      scaled=FALSE)
##D 
##D  # summary of results
##D  summary(satpls)
##D 
##D  # default plot (inner model)
##D  plot(satpls)
##D  
## End(Not run)



