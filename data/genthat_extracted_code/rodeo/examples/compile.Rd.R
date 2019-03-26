library(rodeo)


### Name: compile
### Title: Generate Executable Code
### Aliases: compile

### ** Examples

data(vars, pars, funs, pros, stoi)
model <- rodeo$new(vars, pars, funs, pros, stoi, dim=c(1))
# This would trigger compilation assuming that 'functionsCode.f95' contains
# a Fortran implementation of all functions; see vignette for full example
## Not run: 
##D model$compile(sources="functionsCode.f95")
## End(Not run)



