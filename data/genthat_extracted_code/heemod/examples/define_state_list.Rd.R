library(heemod)


### Name: define_state_list
### Title: Define Markov Model State List
### Aliases: define_state_list define_state_list_ modify.uneval_state_list
### Keywords: internal

### ** Examples

## Not run: 
##D s1 <- define_state(cost = 1, util = 1)
##D s2 <- define_state(cost = 3, util = .4)
##D 
##D states_mod <- define_state_list(
##D   healthy = s1,
##D   sick = s2
##D )
##D 
##D states_mod
##D 
##D s1_bis <- define_state(cost = 0, util = 1)
##D s3 <- define_state(cost = 10, util = .1)
##D 
##D modify(
##D   states_mod,
##D   healthy = s1_bis,
##D   sicker = s3
##D )
## End(Not run)
  



