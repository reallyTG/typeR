library(Newdistns)


### Name: eg
### Title: Exponentiated Generalized G Distribution
### Aliases: deg peg qeg reg meg
### Keywords: Exponentiated generalized G distribution

### ** Examples
x=runif(10,min=0,max=1)
deg(x,"exp",a=1,b=1)
peg(x,"exp",a=1,b=1)
qeg(x,"exp",a=1,b=1)
reg(10,"exp",a=1,b=1)
meg("exp",rexp(100),starts=c(1,1,1),method="BFGS")


