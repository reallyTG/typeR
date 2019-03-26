library(nat)


### Name: subset.dotprops
### Title: Subset points in dotprops object that match given conditions
### Aliases: subset.dotprops

### ** Examples

## subset using indices ...
dp=kcs20[[10]]
dp1=subset(dp, 1:50)

# ... or an expression
dp2=subset(dp, alpha>0.7)
front=subset(dp, points[,'Z']<40)
# use a helper function
between=function(x, lower, upper) x>=lower & x<=upper
middle=middle=subset(dp, between(points[,'Z'], 40, 60))

# plot results in 3D
## No test: 
plot3d(front, col='red')
plot3d(middle, col='green')
plot3d(dp, col='blue')
## End(No test)

## Not run: 
##D 
##D ## subset using an selection function
##D s3d=select3d()
##D dp1=subset(dp, s3d(points))
##D # special case of previous version
##D dp2=subset(dp, s3d)
##D # keep the points that were removed from dp2
##D dp2.not=subset(dp, s3d, invert=TRUE)
##D # (another way of doing the same thing)
##D dp2.not=subset(dp, Negate(s3d))
##D stopifnot(all.equal(dp1, dp2))
##D dp2=subset(dp, alpha>0.5 & s3d(pointd))
##D dp3=subset(dp, 1:10)
##D 
##D ## subset each dotprops object in a whole neuronlist
##D plot3d(kcs20)
##D s3d=select3d()
##D kcs20.partial = nlapply(kcs20, subset, s3d)
##D clear3d()
##D plot3d(kcs20.partial, col='red')
##D plot3d(kcs20, col='grey')
## End(Not run)



