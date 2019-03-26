library(futile.logger)


### Name: flog.logger
### Title: Manage loggers
### Aliases: flog.debug flog.error flog.fatal flog.info flog.logger
###   flog.trace flog.warn
### Keywords: data

### ** Examples


flog.threshold(DEBUG)
flog.debug("This debug message will print")

flog.threshold(WARN)
flog.debug("This one won't")

m <- matrix(rnorm(12), nrow=3)
flog.info("Matrix:",m, capture=TRUE)

ftry(log(-1))

## Not run: 
##D s <- c('FCX','AAPL','JPM','AMZN')
##D p <- TawnyPortfolio(s)
##D 
##D flog.threshold(TRACE,'tawny')
##D ws <- optimizePortfolio(p, RandomMatrixDenoiser())
##D z <- getIndexComposition()
##D 
##D flog.threshold(WARN,'tawny')
##D ws <- optimizePortfolio(p, RandomMatrixDenoiser())
##D z <- getIndexComposition()
##D 
## End(Not run)



