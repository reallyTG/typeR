library(rodeo)


### Name: setVars
### Title: Assign Values to State Variables
### Aliases: setVars

### ** Examples

data(vars, pars, funs, pros, stoi)
x0 <- c(bac=0.1, sub=0.5)

# 0-dimensional model
model <- rodeo$new(vars, pars, funs, pros, stoi, dim=c(1))
model$setVars(x0)
print(model$getVars())

# How to sort vector elements
x0 <- c(sub=0.5, bac=0.1)              # doesn't match order of variables
model$setVars(x0[model$namesVars()])

# 1-dimensional model with 3 boxes
nBox <- 3
model <- rodeo$new(vars, pars, funs, pros, stoi, dim=c(nBox))
x1 <- matrix(rep(x0, each=nBox), nrow=nBox, ncol=model$lenVars(),
  dimnames=list(NULL, model$namesVars()))
model$setVars(x1)
print(model$getVars())
print(model$getVars(asArray=TRUE))

# 2-dimensional model with 3 x 4 boxes
model <- rodeo$new(vars, pars, funs, pros, stoi, dim=c(3,4))
x2 <- array(rep(x0, each=3*4), dim=c(4,3,model$lenVars()),
  dimnames=list(dim2=NULL, dim1=NULL, variables=model$namesVars()))
model$setVars(x2)
print(model$getVars())
print(model$getVars(asArray=TRUE))



