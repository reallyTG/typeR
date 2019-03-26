library(SiMRiv)


### Name: Arith-methods
### Title: Shortcuts for defining species movement states
### Aliases: Arith-methods +-methods +,list,state-method
###   +,species,ANY-method +,state,list-method +,state,numeric-method
###   +,state,state-method *,state,numeric-method *,species,ANY-method
### Keywords: methods math spatial

### ** Examples

# define a species with two states
twostatespecies <- species(state.RW() + state.CRW(0.9)
  , transitionMatrix(0.01, 0.02))

# set the perception window radius of both states to 200
# and the step length to 10
twostatespecies <- twostatespecies * 200 + 10



