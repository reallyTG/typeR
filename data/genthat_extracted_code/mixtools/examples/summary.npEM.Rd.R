library(mixtools)


### Name: summary.npEM
### Title: Summarizing non- and semi-parametric multivariate mixture model
###   fits
### Aliases: summary.npEM print.summary.npEM
### Keywords: file

### ** Examples

data(Waterdata)
set.seed(100)
## Not run: 
##D a <- npEM(Waterdata[,3:10], 3, bw=4) # Assume indep but not iid
##D summary(a) 
##D 
##D b <- npEM(Waterdata[,3:10], 3, bw=4, blockid=rep(1,8)) # Now assume iid
##D summary(b)
## End(Not run)



