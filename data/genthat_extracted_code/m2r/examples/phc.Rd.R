library(m2r)


### Name: phc
### Title: PHCpack
### Aliases: phc solve_system solve_system. mixed_volume

### ** Examples


## Not run: 
##D  requires Macaulay2
##D 
##D # for this to work, you need to have modified your
##D # init-PHCpack.m2 file instead of changing your .bashrc
##D # file to establish the path of phc
##D # (**clarify**, maybe checkout algstat::polySolve)
##D 
##D (mpolyList <- mp(c("t^4 - x", "t^3 - y", "t^2 - z", "x+y+z")))
##D solve_system(mpolyList)
##D mixed_volume(mpolyList)
##D 
## End(Not run)



