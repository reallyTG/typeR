library(holdem)


### Name: vera
### Title: A sample function that goes all in or folds
### Aliases: vera
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function(numattable1, crds1, board1,  round1, currentbet,  mychips1, pot1, 
    roundbets, blinds1, chips1, ind1, dealer1, tablesleft){
    ## if any pair, suited anything, or if the smaller card is at least 9, 
    ## then all in    
    a1 = 0
    if((crds1[1,1] == crds1[2,1]) || (crds1[1,2] == crds1[2,2]) || (crds1[2,1] > 8.5)) a1 = mychips1
    a1
  } ## end of vera



