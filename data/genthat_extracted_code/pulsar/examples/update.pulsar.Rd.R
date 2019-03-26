library(pulsar)


### Name: update.pulsar
### Title: Update a pulsar call
### Aliases: update.pulsar

### ** Examples

## Not run: 
##D p <- 40 ; n <- 1200
##D dat   <- huge.generator(n, p, "hub", verbose=FALSE, v=.1, u=.3)
##D lams  <- getLamPath(getMaxCov(dat$data), .01, len=20)
##D 
##D ## Run pulsar with huge
##D hugeargs <- list(lambda=lams, verbose=FALSE)
##D out.p <- pulsar(dat$data, fun=huge::huge, fargs=hugeargs,
##D                 rep.num=20, criterion='stars')
##D 
##D ## update call, adding bounds
##D out.b <- update(out.p, lb.stars=TRUE, ub.stars=TRUE)
## End(Not run)



