library(plspm)


### Name: plspm
### Title: PLS-PM: Partial Least Squares Path Modeling
### Aliases: plspm plspm-package

### ** Examples

## Not run: 
##D ## typical example of PLS-PM in customer satisfaction analysis
##D ## model with six LVs and reflective indicators
##D 
##D # load dataset satisfaction
##D data(satisfaction)
##D 
##D # path matrix
##D IMAG = c(0,0,0,0,0,0)
##D EXPE = c(1,0,0,0,0,0)
##D QUAL = c(0,1,0,0,0,0)
##D VAL = c(0,1,1,0,0,0)
##D SAT = c(1,1,1,1,0,0)
##D LOY = c(1,0,0,0,1,0)
##D sat_path = rbind(IMAG, EXPE, QUAL, VAL, SAT, LOY)
##D 
##D # plot diagram of path matrix
##D innerplot(sat_path)
##D 
##D # blocks of outer model
##D sat_blocks = list(1:5, 6:10, 11:15, 16:19, 20:23, 24:27)
##D 
##D # vector of modes (reflective indicators)
##D sat_mod = rep("A", 6)
##D 
##D # apply plspm
##D satpls = plspm(satisfaction, sat_path, sat_blocks, modes = sat_mod,
##D    scaled = FALSE)
##D 
##D # plot diagram of the inner model
##D innerplot(satpls)
##D 
##D # plot loadings
##D outerplot(satpls, what = "loadings")
##D 
##D # plot outer weights
##D outerplot(satpls, what = "weights")
## End(Not run)



