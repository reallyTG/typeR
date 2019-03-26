library(logger)


### Name: log_eval
### Title: Evaluate an expression and log results
### Aliases: log_eval

### ** Examples

## Not run: 
##D log_eval(pi * 2, level = INFO)
##D 
##D ## lowering the log level threshold so that we don't have to set a higher level in log_eval
##D log_threshold(TRACE)
##D log_eval(x <- 4)
##D log_eval(sqrt(x))
##D 
##D ## log_eval can be called in-line as well as returning the return value of the expression
##D x <- log_eval(mean(runif(1e3)))
##D x
##D 
##D ## https://twitter.com/krlmlr/status/1067864829547999232
##D f <- sqrt
##D g <- mean
##D x <- 1:31
##D log_eval(f(g(x)), level = INFO)
##D log_eval(y <- f(g(x)), level = INFO)
##D 
##D ## returning a function
##D log_eval(f <- sqrt)
##D log_eval(f)
##D 
##D ## evaluating something returning a wall of "text"
##D log_eval(f <- log_eval)
##D log_eval(f <- log_eval, multiline = TRUE)
##D 
##D ## doing something computationally intensive
##D log_eval(system.time(for(i in 1:100) mad(runif(1000))), multiline = TRUE)
## End(Not run)



