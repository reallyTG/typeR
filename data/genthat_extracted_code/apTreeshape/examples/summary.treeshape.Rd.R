library(apTreeshape)


### Name: summary.treeshape
### Title: Print a summary of an object of class "treeshape"
### Aliases: summary.treeshape
### Keywords: manip

### ** Examples


## Summary of a PDA tree with 100 tips.
summary(rpda(100)) 
## Note that the standard deviation is very large. 

## Summary of a Yule tree with 100 tips.
summary(ryule(100)) 
## The standard deviation under the Yule model is much smaller than under 
##      the PDA model.

## Summary of the HIV tree.
data(hivtree.treeshape)
summary(hivtree.treeshape) 
## The HIV tree is much closer from the Yule model than from the PDA model. 



