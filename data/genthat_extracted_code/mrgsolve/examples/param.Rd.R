library(mrgsolve)


### Name: param
### Title: Create and work with parameter objects
### Aliases: param param,mrgmod-method param,mrgsims-method
###   param,missing-method param,list-method param,ANY-method
###   show,parameter_list-method allparam as.param as.param,list-method
###   as.param,numeric-method as.param,parameter_list-method
###   as.param,missing-method $,mrgmod-method
### Keywords: param

### ** Examples

## example("param")
mod <- mrgsolve:::house()

param(mod)
param(mod, .pat="^(C|F)") ## may be useful when large number of parameters

class(param(mod))

param(mod)$KA

as.list(param(mod))
as.data.frame(param(mod))




