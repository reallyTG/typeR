library(Newdistns)


### Name: gammag1
### Title: Gamma G Distribution due to Zografos and Balakrishnan (2009)
### Aliases: dgammag1 pgammag1 qgammag1 rgammag1 mgammag1
### Keywords: Gamma G distribution due to Zografos and Balakrishnan (2009)

### ** Examples
x=runif(10,min=0,max=1)
dgammag1(x,"exp",a=1)
pgammag1(x,"exp",a=1)
qgammag1(x,"exp",a=1)
rgammag1(10,"exp",a=1)
mgammag1("exp",rexp(100),starts=c(1,1),method="BFGS")


