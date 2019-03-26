library(pulsar)


### Name: pulsar
### Title: pulsar: serial or parallel mode
### Aliases: pulsar

### ** Examples

## Not run: 
##D ## Generate the data with huge:
##D library(huge)
##D p <- 40 ; n <- 1200
##D dat   <- huge.generator(n, p, "hub", verbose=FALSE, v=.1, u=.3)
##D lams  <- getLamPath(getMaxCov(dat$data), .01, len=20)
##D 
##D ## Run pulsar with huge
##D hugeargs <- list(lambda=lams, verbose=FALSE)
##D out.p <- pulsar(dat$data, fun=huge::huge, fargs=hugeargs,
##D                 rep.num=20, criterion='stars')
##D 
##D ## Run pulsar in bounded stars mode and include gcd metric:
##D out.b <- pulsar(dat$data, fun=huge::huge, fargs=hugeargs,
##D                 rep.num=20, criterion=c('stars', 'gcd'),
##D                 lb.stars=TRUE, ub.stars=TRUE)
##D plot(out.b)
## End(Not run)



