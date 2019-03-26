library(plaqr)


### Name: plaqr
### Title: Partially Linear Additive Quantile Regression
### Aliases: plaqr

### ** Examples

data(simData)

ss <- vector("list", 2)
ss[[2]]$degree <- 5
ss[[2]]$Boundary.knots <- c(-1, 1)

plaqr(y~., nonlinVars=~z1+z2, data=simData) 
#same as plaqr(formula= y~x1+x2+x3, nonlinVars=~z1+z2, data=simData)

plaqr(y~0, nonlinVars=~z1+z2, data=simData, splinesettings=ss) #no linear terms in the model

plaqr(y~., data=simData) #all linear terms



