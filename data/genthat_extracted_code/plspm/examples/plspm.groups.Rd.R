library(plspm)


### Name: plspm.groups
### Title: Two Groups Comparison in PLS-PM
### Aliases: plspm.groups

### ** Examples

## Not run: 
##D  ## example with customer satisfaction analysis
##D  ## group comparison based on the segmentation variable "gender"
##D 
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
##D  sat_path = rbind(IMAG, EXPE, QUAL, VAL, SAT, LOY)
##D 
##D  # define outer model list
##D  sat_blocks = list(1:5, 6:10, 11:15, 16:19, 20:23, 24:27)
##D 
##D  # define vector of reflective modes
##D  sat_mod = rep("A", 6)
##D 
##D  # apply plspm
##D  satpls = plspm(satisfaction, sat_path, sat_blocks,
##D                 modes = sat_mod, scaled = FALSE)
##D 
##D  # permutation test with 100 permutations
##D  group_perm = plspm.groups(satpls, satisfaction$gender,
##D                            method="permutation", reps=100)
##D  group_perm
##D  
## End(Not run)



