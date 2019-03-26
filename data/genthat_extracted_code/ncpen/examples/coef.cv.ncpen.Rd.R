library(ncpen)


### Name: coef.cv.ncpen
### Title: coef.cv.ncpen: extracts the optimal coefficients from
###   'cv.ncpen'.
### Aliases: coef.cv.ncpen

### ** Examples

### linear regression with scad penalty
sam =  sam.gen.ncpen(n=200,p=10,q=5,cf.min=0.5,cf.max=1,corr=0.5)
x.mat = sam$x.mat; y.vec = sam$y.vec
fit = cv.ncpen(y.vec=y.vec,x.mat=x.mat,n.lambda=10)
coef(fit)
### logistic regression with classo penalty
sam =  sam.gen.ncpen(n=200,p=10,q=5,cf.min=0.5,cf.max=1,corr=0.5,family="binomial")
x.mat = sam$x.mat; y.vec = sam$y.vec
fit = cv.ncpen(y.vec=y.vec,x.mat=x.mat,n.lambda=10,family="binomial",penalty="classo")
coef(fit)
### multinomial regression with sridge penalty
sam =  sam.gen.ncpen(n=200,p=10,q=5,k=3,cf.min=0.5,cf.max=1,corr=0.5,family="multinomial")
x.mat = sam$x.mat; y.vec = sam$y.vec
fit = cv.ncpen(y.vec=y.vec,x.mat=x.mat,n.lambda=10,family="multinomial",penalty="sridge")
coef(fit)



