library(dna)


### Name: get.modules-methods
### Title: Methods for Function 'get.modules'
### Aliases: get.modules get.modules-methods get.modules,modules
### Keywords: methods modules

### ** Examples

# artificial example to show how to obtain modules from a matrix of
# connectivity scores
set.seed(26)
s=matrix(runif(100,-1,1),10,10);diag(s)=1;s=round((s+t(s))/2,1)
the.modules=network.modules(s,m=3,epsilon=.7)
the.modules

# method for extracting the modules
get.modules(the.modules)



