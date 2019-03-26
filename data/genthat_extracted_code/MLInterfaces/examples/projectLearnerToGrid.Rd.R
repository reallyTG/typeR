library(MLInterfaces)


### Name: projectLearnerToGrid
### Title: create learned tesselation of feature space after PC
###   transformation
### Aliases: projectLearnerToGrid
### Keywords: models

### ** Examples

library(mlbench)
# demostrate with 3 dimensional hypercube problem
kk = mlbench.hypercube()
colnames(kk$x) = c("f1", "f2", "f3")
hcu = data.frame(cl=kk$classes, kk$x)
set.seed(1234)
sam = sample(1:nrow(kk$x), size=nrow(kk$x)/2)
ldap = projectLearnerToGrid(cl~., data=hcu, ldaI, 
   sam, predWrapper=function(x)x$class)
plot(ldap)
confuMat(ldap@fittedLearner)
nnetp = projectLearnerToGrid(cl~., data=hcu, nnetI, sam, size=2,
   decay=.01, predExtras=list(type="class"))
plot(nnetp)
confuMat(nnetp@fittedLearner)
#if (requireNamespace("rgl") && interactive()) {
#    learnerIn3D(nnetp)
#    ## customising the rgl plot
#    learnerIn3D(nnetp, size = 10, alpha = 0.1)
#}



