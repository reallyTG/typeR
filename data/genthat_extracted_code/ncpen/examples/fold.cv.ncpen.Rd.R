library(ncpen)


### Name: fold.cv.ncpen
### Title: fold.cv.ncpen: extracts fold ids for 'cv.ncpen'.
### Aliases: fold.cv.ncpen

### ** Examples

### linear regression with scad penalty
sam =  sam.gen.ncpen(n=200,p=20,q=5,cf.min=0.5,cf.max=1,corr=0.5)
x.mat = sam$x.mat; y.vec = sam$y.vec
fold.id = fold.cv.ncpen(c.vec=y.vec,n.fold=10)
### logistic regression with classo penalty
sam =  sam.gen.ncpen(n=200,p=20,q=5,cf.min=0.5,cf.max=1,corr=0.5,family="binomial")
x.mat = sam$x.mat; y.vec = sam$y.vec
fold.id = fold.cv.ncpen(c.vec=y.vec,n.fold=10,family="binomial")
### poison regression with mlog penalty
sam =  sam.gen.ncpen(n=200,p=20,q=5,cf.min=0.5,cf.max=1,corr=0.5,family="poisson")
x.mat = sam$x.mat; y.vec = sam$y.vec
fold.id = fold.cv.ncpen(c.vec=y.vec,n.fold=10,family="poisson")
### multinomial regression with sridge penalty
sam =  sam.gen.ncpen(n=200,p=20,q=5,k=3,cf.min=0.5,cf.max=1,corr=0.5,family="multinomial")
x.mat = sam$x.mat; y.vec = sam$y.vec
fold.id = fold.cv.ncpen(c.vec=y.vec,n.fold=10,family="multinomial")
### cox regression with mcp penalty
sam =  sam.gen.ncpen(n=200,p=20,q=5,r=0.2,cf.min=0.5,cf.max=1,corr=0.5,family="cox")
x.mat = sam$x.mat; y.vec = sam$y.vec
fold.id = fold.cv.ncpen(c.vec=x.mat[,21],n.fold=10,family="cox")



