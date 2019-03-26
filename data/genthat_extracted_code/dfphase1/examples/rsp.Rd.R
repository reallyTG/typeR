library(dfphase1)


### Name: rsp
### Title: Distribution-Free Phase I Analysis of Univariate Data based on
###   Recursive Segmentation and Permutation
### Aliases: rsp
### Keywords: htest statistical process monitoring statistical process
###   control distribution-free methods

### ** Examples

# Individual observations with a transient level change
set.seed(112233)
level <- c(rep(0,20),rep(3,10),rep(0,20))
x <- level+rt(50,4)
rsp(x)
# Individual observations with a scale step change
scale <- c(rep(1,25),rep(3,25))
x <- scale*rt(50,4)
rsp(x)
data(fe)
rsp(fe)
data(colonscopy)
rsp(colonscopy)



