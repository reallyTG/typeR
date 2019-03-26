library(pander)


### Name: eval.msgs
### Title: Evaluate with messages
### Aliases: eval.msgs

### ** Examples

## Not run: 
##D eval.msgs('1:5')
##D eval.msgs('x <- 1:5')
##D eval.msgs('lm(mtcars$hp ~ mtcars$wt)')
##D 
##D ## plots
##D eval.msgs('plot(runif(100))')
##D eval.msgs('histogram(runif(100))')
##D 
##D ## error handling
##D eval.msgs('runiff(23)')
##D eval.msgs('runif is a nice function')
##D eval.msgs('no.R.object.like.that')
##D 
##D ## messages
##D eval.msgs(c('message("FOO")', '1:2'))
##D eval.msgs(c('warning("FOO")', '1:2'))
##D eval.msgs(c('message("FOO");message("FOO");warning("FOO")', '1:2'))
##D eval.msgs('warning("d");warning("f");1')
##D 
##D ## stdout
##D eval.msgs('cat("writing to console")')
##D eval.msgs('cat("writing to console");1:4')
## End(Not run)



