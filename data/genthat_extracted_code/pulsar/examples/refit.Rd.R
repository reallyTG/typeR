library(pulsar)


### Name: refit
### Title: Refit pulsar model
### Aliases: refit

### ** Examples


## Generate the data with huge:
## Not run: 
##D library(huge)
##D set.seed(10010)
##D p <- 40 ; n <- 1200
##D dat   <- huge.generator(n, p, "hub", verbose=FALSE, v=.1, u=.3)
##D lams  <- getLamPath(getMaxCov(dat$data), .01, len=20)
##D 
##D ## Run pulsar with huge
##D hugeargs <- list(lambda=lams, verbose=FALSE)
##D out.p <- pulsar(dat$data, fun=huge::huge, fargs=hugeargs,
##D                 rep.num=20, criterion='stars')
##D 
##D fit  <- refit(out.p)
## End(Not run)



