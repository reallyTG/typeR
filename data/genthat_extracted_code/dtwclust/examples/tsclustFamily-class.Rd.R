library(dtwclust)


### Name: tsclustFamily-class
### Title: Class definition for 'tsclustFamily'
### Aliases: tsclustFamily-class tsclustFamily

### ** Examples


## Not run: 
##D data(uciCT)
##D # See "GAK" documentation
##D fam <- new("tsclustFamily", dist = "gak")
##D 
##D # This is done with symmetric optimizations, regardless of control$symmetric
##D crossdist <- fam@dist(CharTraj, window.size = 18L)
##D 
##D # This is done without symmetric optimizations, regardless of control$symmetric
##D crossdist <- fam@dist(CharTraj, CharTraj, window.size = 18L)
##D 
##D # For non-dtwclust distances, symmetric optimizations only apply
##D # with an appropriate control AND a single data argument:
##D fam <- new("tsclustFamily", dist = "dtw",
##D            control = partitional_control(symmetric = TRUE))
##D fam@dist(CharTraj[1L:5L])
##D 
##D # If you want the fuzzy family, use fuzzy = TRUE
##D ffam <- new("tsclustFamily", control = fuzzy_control(), fuzzy = TRUE)
## End(Not run)




