library(simctest)


### Name: mcp
### Title: Function mcp in package 'simctest'
### Aliases: mcp

### ** Examples

#The following example takes a bit of computing time
## Not run: 
##D #Example where we know the power should be the level of the test
##D genstream <- function(){p <- runif(1); function(N){runif(N) <= p}}
##D 
##D res <- mcp(genstream, alpha=0.05, delta="adaptive", cp=0.99)
##D 
##D #should find confidence interval of length 0.02 centered around 0.05
##D res
## End(Not run)



