library(VCA)


### Name: isBalanced
### Title: Check Whether Design Is Balanced Or Not.
### Aliases: isBalanced

### ** Examples


## Not run: 
##D data1 <- data.frame(site=gl(3,8), lot=factor(rep(c(2,3,1,2,3,1), 
##D                     rep(4,6))), day=rep(1:12, rep(2,12)), y=rnorm(24,25,1))
##D 
##D # not all combinations of 'site' and 'lot' in 'data1'
##D 
##D VCA:::isBalanced(y~site+lot+site:lot:day, data1)
##D 
##D # balanced design for this model
##D 
##D VCA:::isBalanced(y~lot+lot:day, data1)
##D 
##D # gets unbalanced if observation is NA
##D 
##D data1[1,"y"] <- NA
##D VCA:::isBalanced(y~lot+lot:day, data1)
##D VCA:::isBalanced(y~lot+lot:day, data1, FALSE)
## End(Not run)



