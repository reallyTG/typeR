library(ncpen)


### Name: ncpen.reg
### Title: ncpen.reg: nonconvex penalized estimation
### Aliases: ncpen.reg

### ** Examples

### linear regression with scad penalty
sam =  sam.gen.ncpen(n=200,p=5,q=5,cf.min=0.5,cf.max=1,corr=0.5,family="gaussian")
x.mat = sam$x.mat; y.vec = sam$y.vec
data = cbind(y.vec, x.mat)
colnames(data) = c("y", paste("xv", 1:ncol(x.mat), sep = ""))
fit1 = ncpen.reg(formula = y ~ xv1 + xv2 + xv3 + xv4 + xv5, data = data,
                 family="gaussian", penalty="scad")
fit2 = ncpen(y.vec=y.vec,x.mat=x.mat);




