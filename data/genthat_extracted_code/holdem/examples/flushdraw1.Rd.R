library(holdem)


### Name: flushdraw1
### Title: Sees if you have a flush draw.
### Aliases: flushdraw1

### ** Examples

x = c(1,2,4,1,3,1,1)
flushdraw1(x)
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function(x){
    a1 = mycount1(x)
    max(a1$ct)
  } ## end of flushdraw1



