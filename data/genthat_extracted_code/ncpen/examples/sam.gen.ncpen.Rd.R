library(ncpen)


### Name: sam.gen.ncpen
### Title: sam.gen.ncpen: generate a simulated dataset.
### Aliases: sam.gen.ncpen

### ** Examples

### linear regression
sam =  sam.gen.ncpen(n=200,p=20,q=5,cf.min=0.5,cf.max=1,corr=0.5)
x.mat = sam$x.mat; y.vec = sam$y.vec
head(x.mat); head(y.vec)



