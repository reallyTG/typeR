library(ncpen)


### Name: plot.cv.ncpen
### Title: plot.cv.ncpen: plot cross-validation error curve.
### Aliases: plot.cv.ncpen

### ** Examples

### linear regression with scad penalty
par(mfrow=c(1,2))
sam =  sam.gen.ncpen(n=500,p=10,q=5,cf.min=0.5,cf.max=1,corr=0.5,family="gaussian")
x.mat = sam$x.mat; y.vec = sam$y.vec
fit = cv.ncpen(y.vec=y.vec,x.mat=x.mat,n.lambda=50,family="gaussian", penalty="scad")
plot(fit)
plot(fit,log.scale=F)




