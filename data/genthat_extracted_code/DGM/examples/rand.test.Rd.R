library(DGM)


### Name: rand.test
### Title: Randomization test for Patel's kappa. Creates a distribution of
###   values kappa under the null hypothesis.
### Aliases: rand.test

### ** Examples

# create some sample data with 200 samples,
# 3 nodes, and 2 subjects
ts = array(rnorm(200*3*5), dim=c(200,3,5))
mysubs=list()
mysubs[[1]]=patel(ts[,,1])
mysubs[[2]]=patel(ts[,,2])
mysubs[[3]]=patel(ts[,,3])
mysubs[[4]]=patel(ts[,,4])
mysubs[[5]]=patel(ts[,,5])
g=patel.group(mysubs)
r=rand.test(rmdiag(g$kappa), K=100)



