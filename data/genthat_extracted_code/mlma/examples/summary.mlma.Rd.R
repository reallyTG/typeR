library(mlma)


### Name: summary.mlma
### Title: Summary of "mlma" Object
### Aliases: summary.mlma print.summary.mlma
### Keywords: summary statistics

### ** Examples

data(sim.111)
temp<-mlma(y=sim.111$y, biny=FALSE, data1=data1, x=sim.111$x, levelx=1, m=sim.111$m, 
                l1=1:2,c1=3, c1r=1,level=sim.111$level,org.data=TRUE,
                f01y=c("x","log(x^2)"), f10y=c("x^2","sqrt(x+6)"), 
                f20ky=list(2,c("x","x^3")), f01km1=list(2,"sqrt(x)+3"), 
                f10km=list(2,"log(x+2)"))
summary(temp)



