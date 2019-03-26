library(ncpen)


### Name: cv.ncpen
### Title: cv.ncpen: cross validation for 'ncpen'
### Aliases: cv.ncpen

### ** Examples

### linear regression with scad penalty
sam =  sam.gen.ncpen(n=200,p=10,q=5,cf.min=0.5,cf.max=1,corr=0.5,family="gaussian")
x.mat = sam$x.mat; y.vec = sam$y.vec
fit = cv.ncpen(y.vec=y.vec,x.mat=x.mat,n.lambda=10,family="gaussian", penalty="scad")
coef(fit)




