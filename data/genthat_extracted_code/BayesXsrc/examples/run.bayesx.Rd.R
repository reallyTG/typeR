library(BayesXsrc)


### Name: run.bayesx
### Title: Run BayesX
### Aliases: run.bayesx
### Keywords: regression

### ** Examples

## Not run: 
##D ## create a temporary directory for this example
##D dir <- tempdir()
##D prg <- file.path(dir, "demo.prg")
##D 
##D ## generate some data
##D set.seed(111)
##D n <- 200
##D 
##D ## regressor
##D dat <- data.frame(x = runif(n, -3, 3))
##D 
##D ## response
##D dat$y <- with(dat, 1.5 + sin(x) + rnorm(n, sd = 0.6))
##D 
##D ## write data to dir
##D write.table(dat, file.path(dir, "data.raw"),
##D   quote = FALSE, row.names = FALSE)
##D 
##D ## create the .prg file
##D writeLines("
##D bayesreg b
##D dataset d 
##D d.infile using data.raw
##D b.outfile = mcmc
##D b.regress y = x(psplinerw2,nrknots=20,degree=3), family=gaussian predict using d
##D b.getsample", prg)
##D 
##D ## run the .prg file from R
##D run.bayesx(prg)
## End(Not run)



