library(mrgsolve)


### Name: init
### Title: Methods for working with the model compartment list
### Aliases: init init,mrgmod-method init,mrgsims-method
###   init,missing-method init,list-method init,ANY-method as.init
###   as.init,list-method as.init,numeric-method as.init,cmt_list-method
###   as.init,missing-method as.init,NULL-method show,cmt_list-method

### ** Examples

## example("init")
mod <- mrgsolve:::house()

init(mod)
init(mod, .pat="^C") ## may be useful for large models

class(init(mod))

init(mod)$CENT

as.list(init(mod))
as.data.frame(init(mod))



