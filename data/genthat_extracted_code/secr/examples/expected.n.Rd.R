library(secr)


### Name: expected.n
### Title: Expected Number of Individuals
### Aliases: expected.n
### Keywords: models

### ** Examples


expected.n(secrdemo.0)

## Not run: 
##D expected.n(secrdemo.0, bycluster = TRUE)
##D expected.n(ovenbird.model.D)
##D 
##D ## Clustered design
##D mini <- make.grid(nx = 3, ny = 3, spacing = 50, detector =
##D     "proximity")
##D tempgrids <- trap.builder (cluster = mini , method = "all",
##D     frame = expand.grid(x = seq(1000, 9000, 2000),
##D     y = seq(1000, 9000, 2000)), plt = TRUE)
##D capt <- sim.capthist(tempgrids, popn = list(D = 2))
##D tempmask <- make.mask(tempgrids, buffer = 100,
##D     type = "clusterbuffer")
##D fit <- secr.fit(capt, mask = tempmask, trace = FALSE)
##D En <- expected.n(fit, bycluster = TRUE)
##D 
##D ## GoF or overdispersion statistic
##D p <- length(fit$fit$par)
##D y <- cluster.counts(capt)
##D ## scaled by n-p
##D sum((y - En)^2 / En) / (length(En)-p)
##D sum((y - En)^2 / En) / sum(y/En)
##D 
## End(Not run)




