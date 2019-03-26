library(pso)


### Name: test.result-class
### Title: Class "test.result"
### Aliases: test.result-class
### Keywords: classes

### ** Examples

showClass("test.result")

set.seed(1)
t <- test.problem("rastrigin",10)
o <- psoptim(t)
show(o)

## Not run: 
##D plot(o)
## End(Not run)



