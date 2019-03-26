library(ncpen)


### Name: control.ncpen
### Title: control.ncpen: do preliminary works for 'ncpen'.
### Aliases: control.ncpen

### ** Examples

### linear regression with scad penalty
sam =  sam.gen.ncpen(n=200,p=10,q=5,cf.min=0.5,cf.max=1,corr=0.5)
x.mat = sam$x.mat; y.vec = sam$y.vec
tun = control.ncpen(y.vec=y.vec,x.mat=x.mat,n.lambda=10,tau=1)
tun$tau
### multinomial regression with sridge penalty
sam =  sam.gen.ncpen(n=200,p=10,q=5,k=3,cf.min=0.5,cf.max=1,corr=0.5,family="multinomial")
x.mat = sam$x.mat; y.vec = sam$y.vec
tun = control.ncpen(y.vec=y.vec,x.mat=x.mat,n.lambda=10,
                    family="multinomial",penalty="sridge",gamma=10)
### cox regression with mcp penalty
sam =  sam.gen.ncpen(n=200,p=10,q=5,r=0.2,cf.min=0.5,cf.max=1,corr=0.5,family="cox")
x.mat = sam$x.mat; y.vec = sam$y.vec
tun = control.ncpen(y.vec=y.vec,x.mat=x.mat,n.lambda=10,family="cox",penalty="scad")



