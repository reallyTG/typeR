library(sig)


### Name: sig
### Title: Generate a function signature object
### Aliases: sig

### ** Examples

sig(R.Version)               #no args
sig(scan)                    #lots of args
sig(function(x, y) {x + y})  #anonymous
sig(sum)                     #primitive
fn_list <- list(
  mean = mean,
  var = var
)
lapply(fn_list, sig)         #names are a mess
Map(                         #use Map for lists
  sig,
  fn_list,
  names(fn_list)             #Map mangles names, so override
)



