library(dMod)


### Name: repar
### Title: Reparameterization
### Aliases: repar

### ** Examples

innerpars <- letters[1:3]
constraints <- c(a = "b + c")
mycondition <- "cond1"

trafo <- repar("x ~ x", x = innerpars)
trafo <- repar("x ~ y", trafo, x = names(constraints), y = constraints)
trafo <- repar("x ~ exp(x)", trafo, x = innerpars)
trafo <- repar("x ~ x + Delta_x_condition", trafo, x = innerpars, condition = mycondition)



