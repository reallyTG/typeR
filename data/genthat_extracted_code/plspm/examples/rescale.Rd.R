library(plspm)


### Name: rescale
### Title: Rescale Latent Variable Scores
### Aliases: rescale

### ** Examples

## Not run: 
##D  ## example with customer satisfaction analysis
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
##D  sat_modes = rep("A", 6)
##D 
##D  # apply plspm
##D  my_pls = plspm(satisfaction, sat_path, sat_blocks, modes = sat_modes,
##D               scaled=FALSE)
##D 
##D  # rescaling standardized scores of latent variables
##D  new_scores = rescale(my_pls)
##D 
##D  # compare standardized LVs against rescaled LVs
##D  summary(my_pls$scores)
##D  summary(new_scores)
##D  
## End(Not run)



