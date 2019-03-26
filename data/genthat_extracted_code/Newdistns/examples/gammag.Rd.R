library(Newdistns)


### Name: gammag
### Title: Gamma Uniform G Distribution
### Aliases: dgammag pgammag qgammag rgammag mgammag
### Keywords: Gamma uniform G distribution

### ** Examples
x=runif(10,min=0,max=1)
dgammag(x,"exp",a=1)
pgammag(x,"exp",a=1)
qgammag(x,"exp",a=1)
rgammag(10,"exp",a=1)
mgammag("exp",rexp(100),starts=c(1,1),method="BFGS")


