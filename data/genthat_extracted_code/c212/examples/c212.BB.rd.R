library(c212)


### Name: c212.BB
### Title: Implementation of the Berry and Berry Three-Level Hierarchical
###   Model.
### Aliases: c212.BB
### Keywords: c212.BB Bayesian Hierarchy Point-mass Berry and Berry

### ** Examples


## Not run: 
##D 
##D data(c212.trial.data)
##D raw = c212.BB(c212.trial.data)
##D 
##D raw$B
##D [1] "Bdy-sys_1" "Bdy-sys_2" "Bdy-sys_3" "Bdy-sys_4" "Bdy-sys_5" "Bdy-sys_6"
##D [7] "Bdy-sys_7" "Bdy-sys_8"
##D 
##D mean(raw$theta[2, 1,1,])
##D [1] 0.1088401
##D 
##D median(raw$theta[2, 1,1,])
##D [1] 0
##D 
## End(Not run)



