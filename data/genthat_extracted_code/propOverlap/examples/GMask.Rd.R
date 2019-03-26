library(propOverlap)


### Name: GMask
### Title: Producing Gene Masks.
### Aliases: GMask
### Keywords: robust univar

### ** Examples

data(leukaemia)
GenesExpression <- leukaemia[1:7129,] #define the features matrix
Class           <- leukaemia[7130,]   #define the observations' class labels
Gene.Masks      <- GMask(GenesExpression, CI.emprical(GenesExpression, Class), Class)
Gene.Masks[1:100,]                    #show the masks of the first 100 features



