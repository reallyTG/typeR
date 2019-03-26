library(LSC)


### Name: LSC-package
### Title: Local Statistical Compelxity - Automated Pattern Discovery in
###   Spatio-Temporal Data
### Aliases: LSC LSC-package
### Keywords: package

### ** Examples

## known predictive state space with a state-vector
data(contCA00)
ll <- states2LSC(states = contCA00$predictive_states - min(contCA00$predictive_states) + 
    1)
image2(ll, density = TRUE, legend = FALSE)

# An example using estimates from LICORS
## Not run: 
##D example(LICORS)  # this will give an object 'mod' of class 'LICORS'
##D image2(LICORS2LSC(mod))
## End(Not run)



