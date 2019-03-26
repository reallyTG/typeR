library(ncpen)


### Name: predict.ncpen
### Title: predict.ncpen: make predictions from an 'ncpen' object
### Aliases: predict.ncpen

### ** Examples

### linear regression with scad penalty
sam =  sam.gen.ncpen(n=200,p=20,q=5,cf.min=0.5,cf.max=1,corr=0.5)
x.mat = sam$x.mat; y.vec = sam$y.vec
fit = ncpen(y.vec=y.vec[1:190],x.mat=x.mat[1:190,])
predict(fit,"y",new.x.mat=x.mat[190:200,])
### logistic regression with classo penalty
sam =  sam.gen.ncpen(n=200,p=20,q=5,k=3,cf.min=0.5,cf.max=1,corr=0.5,family="binomial")
x.mat = sam$x.mat; y.vec = sam$y.vec
fit = ncpen(y.vec=y.vec[1:190],x.mat=x.mat[1:190,],family="binomial",penalty="classo")
predict(fit,"y",new.x.mat=x.mat[190:200,])
predict(fit,"y",new.x.mat=x.mat[190:200,],prob.cut=0.3)
predict(fit,"reg",new.x.mat=x.mat[190:200,])
predict(fit,"prob",new.x.mat=x.mat[190:200,])
### multinomial regression with sridge penalty
sam =  sam.gen.ncpen(n=200,p=20,q=5,k=3,cf.min=0.5,cf.max=1,corr=0.5,family="multinomial")
x.mat = sam$x.mat; y.vec = sam$y.vec
fit = ncpen(y.vec=y.vec[1:190],x.mat=x.mat[1:190,],family="multinomial",penalty="classo")
predict(fit,"y",new.x.mat=x.mat[190:200,])
predict(fit,"reg",new.x.mat=x.mat[190:200,])
predict(fit,"prob",new.x.mat=x.mat[190:200,])



