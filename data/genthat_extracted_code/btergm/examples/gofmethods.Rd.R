library(btergm)


### Name: gof-methods
### Title: Conduct Goodness-of-Fit Diagnostics on ERGMs, TERGMs, SAOMs, and
###   logit models
### Aliases: gof-methods gofmethods gof.methods gof gof,btergm-method
###   gof,mtergm-method gof,ergm-method gof,network-method
###   gof,matrix-method gof,sienaFit-method gof.btergm gof.mtergm
###   gof.sienaFit gof.network gof.matrix gof.ergm createGOF
### Keywords: methods gof

### ** Examples

## Not run: 
##D # First, create data and fit a TERGM...
##D networks <- list()
##D for(i in 1:10){            # create 10 random networks with 10 actors
##D   mat <- matrix(rbinom(100, 1, .25), nrow = 10, ncol = 10)
##D   diag(mat) <- 0           # loops are excluded
##D   nw <- network(mat)       # create network object
##D   networks[[i]] <- nw      # add network to the list
##D }
##D 
##D covariates <- list()
##D for (i in 1:10) {          # create 10 matrices as covariate
##D   mat <- matrix(rnorm(100), nrow = 10, ncol = 10)
##D   covariates[[i]] <- mat   # add matrix to the list
##D }
##D 
##D fit <- btergm(networks ~ edges + istar(2) +
##D     edgecov(covariates), R = 100)
##D 
##D # Then assess the goodness of fit:
##D g <- gof(fit, statistics = c(triad.directed, esp, maxmod.modularity, 
##D     rocpr), nsim = 50)
##D g
##D plot(g)  # see ?"gof-plot" for details
##D 
##D # createGOF can also be used with user-supplied simulations:
##D library("statnet")
##D data(florentine)
##D gest <- ergm(flomarriage ~ edges + absdiff("wealth"))
##D sim <- simulate(gest, nsim = 50)
##D g <- createGOF(sim, list(flomarriage), statistics = c(esp, ideg), roc = FALSE)
##D g
##D plot(g)
##D 
##D # The help page for the Knecht dataset (?knecht) contains another example.
## End(Not run)



