library(R2BayesX)


### Name: getscript
### Title: Generate an executable R fitted model script
### Aliases: getscript
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
##D ## generate the R script
##D ## and print it
##D script <- getscript(b)
##D script
##D 
##D ## with a pdf device
##D script <- getscript(b, device = pdf, height = 5, width = 6)
##D script
## End(Not run)



