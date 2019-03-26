library(mlma)


### Name: data.org
### Title: Transform and Organize Data for Mediation Analysis
### Aliases: data.org
### Keywords: Data Transformation ~kwd2

### ** Examples

data(sim.211)
example1<-data.org(x=sim.211$x, levelx=2, m=sim.211$m, l1=2,l2=1, c1=3, c1r=1,
                   f01y=c("x","log(x^2)"), f02ky=list(1,c("x","x^2")), 
                   f20ky=list(2,c("x","x^3")), f01km1=list(2,"sqrt(x)+3"), 
                   f01km2=list(1,c("x^1.2","x^2.3")), level=sim.211$level)

data(sim.111)
example2<-data.org(sim.111$x, levelx=1, m=sim.111$m, l1=1:2, c1=3, c1r=1,
                   f01y=c("x","log(x^2)"), f10y=c("x^2","sqrt(x+6)"), 
                   f20ky=list(2,c("x","x^3")), f01km1=list(2,"sqrt(x)+3"), 
                   f10km=list(2,"log(x+2)"), level=sim.111$level)



