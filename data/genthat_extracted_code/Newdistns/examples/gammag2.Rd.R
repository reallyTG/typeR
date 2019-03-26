library(Newdistns)


### Name: gammag2
### Title: Gamma G Distribution due to Ristic and Balakrishnan (2012)
### Aliases: dgammag2 pgammag2 qgammag2 rgammag2 mgammag2
### Keywords: Gamma G distribution due to Ristic and Balakrishnan (2012)

### ** Examples
x=runif(10,min=0,max=1)
dgammag2(x,"exp",a=1)
pgammag2(x,"exp",a=1)
qgammag2(x,"exp",a=1)
rgammag2(10,"exp",a=1)
mgammag2("exp",rexp(10),starts=c(1,1),method="BFGS")


