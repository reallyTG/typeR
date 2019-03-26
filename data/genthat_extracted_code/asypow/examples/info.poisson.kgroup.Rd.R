library(asypow)


### Name: info.poisson.kgroup
### Title: Expected Information Matrix for Single or Multiple Group Poisson
### Aliases: info.poisson.kgroup
### Keywords: htest

### ** Examples

# Find the information matrix for a 3 sample Poisson with
# means 1, 2 and 3 and equal sample sizes
info.pois <- info.poisson.kgroup(c(1,2,3))
print(info.pois)



