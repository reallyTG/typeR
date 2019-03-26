library(holdem)


### Name: gravity
### Title: A sample function that goes all in or folds
### Aliases: gravity
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function(numattable1, crds1, board1,  round1, currentbet, 
    mychips1, pot1, roundbets, blinds1, chips1, ind1, dealer1, tablesleft){
    ## all in with any pair of 10s or greater, 
    ## or AJ-AK, or suited connectors with lowest card a 10 or higher.
    ## if your chip count is less than twice the big blind, go all in 
    ## with any cards.
    a1 = 0
    if((crds1[1,1] == crds1[2,1]) && (crds1[1,1] > 9.5)) a1 = mychips1
    if((crds1[1,1] > 13.5) && (crds1[2,1]>10.5)) a1 = mychips1
    if((crds1[1,1]-crds1[2,1]==1) && (crds1[1,2] == crds1[2,2]) && 
	(crds1[2,1]>9.5)) a1 = mychips1
    if(mychips1 < 2*blinds1)  a1 = mychips1
    a1
  } ## end of gravity



