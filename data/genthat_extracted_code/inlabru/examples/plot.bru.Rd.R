library(inlabru)


### Name: plot.bru
### Title: Plot method for posterior marginals estimated by bru
### Aliases: plot.bru

### ** Examples


## Not run: 
##D 
##D # Generate some data and fit a simple model
##D input.df <- data.frame(x=cos(1:10))
##D input.df <- within(input.df, y <- 5 + 2*cos(1:10) + rnorm(10, mean=0, sd=0.1))
##D fit <- bru(y ~ x, "gaussian", input.df)
##D summary(fit)
##D 
##D # Plot the posterior of the model's x-effect
##D plot(fit, "x")
##D 
## End(Not run)




