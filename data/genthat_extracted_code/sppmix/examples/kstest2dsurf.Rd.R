library(sppmix)


### Name: kstest2dsurf
### Title: Nonparametric Goodness-of-fit test for a point pattern against a
###   surface
### Aliases: kstest2dsurf

### ** Examples

## No test: 
# generate two intensity surfaces; assume the same window [-3,3]x[-3,3]
mixsurf1 <- rmixsurf(m = 3, lambda=100,xlim=c(-3,3),ylim=c(-3,3))
plot(mixsurf1)
mixsurf2 <- rmixsurf(m = 5, lambda=200,xlim=c(-3,3),ylim=c(-3,3))
plot(mixsurf2)
#generate point patterns from the two different models
pp1 <- rsppmix(mixsurf1, truncate=FALSE)
plotmix_2d(mixsurf1,pp1,colors=TRUE)
pp2 <- rsppmix(mixsurf2, truncate=FALSE)
plotmix_2d(mixsurf2,pp2,colors=TRUE)
# Test for goodness of fit, p-value should be small
kstest2d(pp1, pp2)
# Test each pattern for gof against both Poisson models
kstest2dsurf(pp1, mixsurf1)#correct model for pp1
kstest2dsurf(pp1, mixsurf2)#wrong model for pp1
kstest2dsurf(pp2, mixsurf2)#correct model for pp2
kstest2dsurf(pp2, mixsurf1)#wrong model for pp2
## End(No test)




