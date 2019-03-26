library(dna)


### Name: modules-class
### Title: Class '"modules"'
### Aliases: modules-class show,modules-method summary,modules-method
###   get.modules,modules-method
### Keywords: classes

### ** Examples

# artificial example to show how to obtain modules from a matrix of
# connectivity scores
set.seed(26)
s=matrix(runif(100,-1,1),10,10);diag(s)=1;s=round((s+t(s))/2,1)
the.modules=network.modules(s,m=3,epsilon=.7)
the.modules

# summary method useful for large networks
summary(the.modules)

# method for extracting the modules
get.modules(the.modules)

# plot a graph of the modules
## Not run: network.modules(s,m=3,epsilon=.7,plot=TRUE)
## Not run: tkplot.close('1')



