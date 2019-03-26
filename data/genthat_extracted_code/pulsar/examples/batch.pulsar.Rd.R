library(pulsar)


### Name: batch.pulsar
### Title: pulsar: batch mode
### Aliases: batch.pulsar

### ** Examples

## Not run: 
##D ## Generate the data with huge:
##D library(huge)
##D set.seed(10010)
##D p <- 400 ; n <- 1200
##D dat   <- huge.generator(n, p, "hub", verbose=FALSE, v=.1, u=.3)
##D lams  <- getLamPath(.2, .01, len=40)
##D hugeargs  <- list(lambda=lams, verbose=FALSE)
##D 
##D ## Run batch.pulsar using snow on 5 cores, and show progress.
##D options(mc.cores=5)
##D options(batchtools.progress=TRUE, batchtools.verbose=FALSE)
##D out <- batch.pulsar(dat$data, fun=huge::huge, fargs=hugeargs,
##D                  rep.num=20, criterion='stars', conffile='snow')
##D ## Run batch.pulsar on a Torque cluster
##D ## Give each job 1gb of memory and a limit of 30 minutes
##D resources <- list(mem="1GB", nodes="1", walltime="00:30:00")
##D out.p <- batch.pulsar(dat$data, fun=huge::huge, fargs=hugeargs,
##D                  rep.num=100, criterion=c('stars', 'gcd'), conffile='torque'
##D                  job.res=resources, regdir=file.path(getwd(), "testtorq"))
##D plot(out.p)
##D ## take a look at the default torque config and template files we just used
##D file.show(findConfFile('torque'))
##D file.show(findTemplateFile('simpletorque'))
## End(Not run)



