library(errors)


### Name: correl
### Title: Handle Correlations Between 'errors' Objects
### Aliases: correl correl<- set_correl covar covar<- set_covar

### ** Examples

x <- set_errors(1:5, 0.1)
y <- set_errors(1:5, 0.1)

# Self-correlation is of course 1, and cannot be changed
correl(x, x)
## Not run: 
##D correl(x, x) <- 0.5
## End(Not run)

# Cross-correlation can be set, but must be a value between -1 and 1
correl(x, y)
## Not run: 
##D correl(x, y) <- 1.5
## End(Not run)
correl(x, y) <- runif(length(x))
correl(x, y)
covar(x, y)




