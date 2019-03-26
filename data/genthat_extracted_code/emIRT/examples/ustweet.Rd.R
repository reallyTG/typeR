library(emIRT)


### Name: ustweet
### Title: U.S. Twitter Following Data
### Aliases: ustweet
### Keywords: datasets

### ** Examples


## Not run: 
##D data(ustweet)
##D 
##D ## A ridiculously short run to pass CRAN
##D ## For a real test, set maxit to a more reasonable number to reach convergence
##D lout <- networkIRT(.y = ustweet$data,
##D                    .starts = ustweet$starts,
##D                    .priors = ustweet$priors,
##D                    .control = {list(verbose = TRUE,
##D                                     maxit = 3,
##D                                     convtype = 2,
##D                                     thresh = 1e-6,
##D                                     threads = 1
##D                                     )
##D                            },
##D                    .anchor_item = 43
##D                    )
##D 
## End(Not run)




