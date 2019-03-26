library(holdem)


### Name: ursula
### Title: A sample function that goes all in or folds
### Aliases: ursula
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function(numattable1, crds1, board1,  round1, currentbet, mychips1, 
    pot1, roundbets, blinds1, chips1, ind1, dealer1, tablesleft){
    ## if pair of 9s or better, then all in    
    a1 = 0
    if((crds1[1,1] == crds1[2,1]) && (crds1[2,1] > 8.5)) a1 = mychips1
    a1
  } ## end of ursula



