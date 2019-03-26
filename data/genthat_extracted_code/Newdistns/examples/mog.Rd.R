library(Newdistns)


### Name: mog
### Title: Marshall Olkin G Distribution
### Aliases: dmog pmog qmog rmog mmog
### Keywords: Marshall Olkin G distribution

### ** Examples
x=runif(10,min=0,max=1)
dmog(x,"exp",beta=1)
pmog(x,"exp",beta=1)
qmog(x,"exp",beta=1)
rmog(10,"exp",beta=1)
mmog("exp",rexp(100),starts=c(1,1),method="BFGS")


