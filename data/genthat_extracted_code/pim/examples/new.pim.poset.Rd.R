library(pim)


### Name: new.pim.poset
### Title: Create a pim.poset environment
### Aliases: new.pim.poset new.pim.poset,character,numeric-method
###   new.pim.poset,matrix,numeric-method new.pim.poset,list,numeric-method
###   new.pim.poset,matrix,missing-method new.pim.poset,list,missing-method
###   new.pim.poset,missing,numeric-method

### ** Examples

mypos <- new.pim.poset('unique',n=10) # creates empty environment
ls(mypos)
# Using the created poset functions L and R
# Note this is purely as illustration, this makes no sense
# in the context of a pim analysis.
mypos$L(1:10)
mypos$R(1:10)




