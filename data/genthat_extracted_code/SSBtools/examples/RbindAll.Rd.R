library(SSBtools)


### Name: RbindAll
### Title: Combining several data frames when the columns don't match
### Aliases: RbindAll

### ** Examples

zA=data.frame(idA=1:10,idB=rep(10*(1:5),2),
              idC=rep(c(100,200),5),idC2=c(100,rep(200,9)),idC3=rep(100,10),
              idD=99,x=round(rnorm(10),3),xA=round(runif(10),2))
zB=data.frame(idB=10*(1:5),x=round(rnorm(5),3),xB=round(runif(5),2))
zC=data.frame(idC=c(100,200),x=round(rnorm(2),3),xC=round(runif(2),2))
zD=data.frame(idD=99,x=round(rnorm(1),3),xD=round(runif(1),2))
RbindAll(zA,zB,zC,zD)
RbindAll(list(zA,zB,zC,zD))



