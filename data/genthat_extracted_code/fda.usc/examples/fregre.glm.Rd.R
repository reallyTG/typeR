library(fda.usc)


### Name: fregre.glm
### Title: Fitting Functional Generalized Linear Models
### Aliases: fregre.glm
### Keywords: regression

### ** Examples


data(tecator)
x=tecator$absorp.fdata
y=tecator$y$Fat
tt=x[["argvals"]]
dataf=as.data.frame(tecator$y)

nbasis.x=11
nbasis.b=7
basis1=create.bspline.basis(rangeval=range(tt),nbasis=nbasis.x)
basis2=create.bspline.basis(rangeval=range(tt),nbasis=nbasis.b)
 
f=Fat~Protein+x
basis.x=list("x"=basis1)
basis.b=list("x"=basis2)
ldata=list("df"=dataf,"x"=x)
res=fregre.glm(f,family=gaussian(),data=ldata,basis.x=basis.x,
basis.b=basis.b)
summary(res)



