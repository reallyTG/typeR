library(networkreporting)


### Name: add.kp
### Title: attach known populations to a dataframe
### Aliases: add.kp

### ** Examples

## Not run: 
##D 
##D   # if kp.dat is a dataframe with columns 'kp' with known popn names
##D   # and 'total.size' with the total size,
##D   # and my.survey is the dataframe with survey responses
##D 
##D   my.kp.vec <- df.to.kpvec(kp.data, kp.var='kp', kp.value='total.size')
##D   my.survey <- add.kp(my.survey, my.kp.vec)
##D 
##D   # now we can call estimator functions like
##D   # kp.degree.estimator without having to specify known
##D   # populations each time
## End(Not run)



