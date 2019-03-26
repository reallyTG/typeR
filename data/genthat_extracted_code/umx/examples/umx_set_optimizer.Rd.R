library(umx)


### Name: umx_set_optimizer
### Title: umx_set_optimizer
### Aliases: umx_set_optimizer

### ** Examples

library(umx)
umx_set_optimizer() # print the existing state
old = umx_set_optimizer(silent = TRUE) # store the existing state
umx_set_optimizer("SLSQP") # update globally
umx_set_optimizer(old) # set back



