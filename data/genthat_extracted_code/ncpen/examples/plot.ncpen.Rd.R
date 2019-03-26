library(ncpen)


### Name: plot.ncpen
### Title: plot.ncpen: plots coefficients from an 'ncpen' object.
### Aliases: plot.ncpen

### ** Examples

### linear regression with scad penalty
sam =  sam.gen.ncpen(n=200,p=20,q=5,cf.min=0.5,cf.max=1,corr=0.5)
x.mat = sam$x.mat; y.vec = sam$y.vec
fit = ncpen(y.vec=y.vec,x.mat=x.mat)
plot(fit)
### multinomial regression with classo penalty
sam =  sam.gen.ncpen(n=200,p=20,q=5,k=3,cf.min=0.5,cf.max=1,corr=0.5,family="multinomial")
x.mat = sam$x.mat; y.vec = sam$y.vec
fit = ncpen(y.vec=y.vec,x.mat=x.mat,family="multinomial",penalty="classo")
plot(fit)
plot(fit,mult.type="vec",log.scale=TRUE)



