library(rLDCP)


### Name: glmp
### Title: Define the GLMP
### Aliases: glmp

### ** Examples

## Not run: 
##D glmp_method <- function(pm,input){
##D 
##D   pm$pm_depth   <- pm_infer(pm$pm_depth, input[1])
##D   pm$pm_height  <- pm_infer(pm$pm_height,input[2])
##D   pm$pm_width   <- pm_infer(pm$pm_width, input[3])
##D 
##D   pm$pm_frame  <- pm_infer(pm$pm_frame, list( pm$pm_depth$y,
##D                                            pm$pm_height$y,
##D                                            pm$pm_width$y)
##D   )
##D   pm
##D }
##D 
##D my_glmp <- glmp(list(pm_depth  = pm_depth,
##D                      pm_height = pm_height,
##D                      pm_width  = pm_width,
##D                      pm_frame  = pm_frame),
##D                 glmp_method)
##D                 
## End(Not run)



