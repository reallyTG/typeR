library(R2BayesX)


### Name: bayesx_prgfile
### Title: BayesX Program-Files
### Aliases: bayesx_prgfile prgfile
### Keywords: regression

### ** Examples

## Not run: 
##D ## generate some data
##D set.seed(111)
##D n <- 500
##D 
##D ## regressor
##D dat <- data.frame(x = runif(n, -3, 3))
##D 
##D ## response 
##D dat$y <- with(dat, 1.5 + sin(x) + rnorm(n, sd = 0.6))
##D 
##D ## estimate model
##D b <- bayesx(y ~ sx(x), data = dat)
##D 
##D ## now see the prg-file
##D bayesx_prgfile(b)
## End(Not run)



