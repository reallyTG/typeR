library(propOverlap)


### Name: Sel.Features
### Title: Gene (Feature) Selection.
### Aliases: Sel.Features
### Keywords: robust

### ** Examples

data(leukaemia)
GenesExpression <- leukaemia[1:7129,] #define the features matrix
Class           <- leukaemia[7130,]   #define the observations' class labels
## select the minimum subset of features
Selection       <- Sel.Features(GenesExpression, Class)
attributes(Selection)
(Candidates      <- Selection$Features)   #return the selected features
(Covered.observations <- Selection$Covered.Obs) #return the covered observations by the selection
## select a specific number of features
Selection.k      <- Sel.Features(GenesExpression, Class, K=10, Verbose=TRUE)
Selection.k$Features
Selection.k$nMin.Features   #return the size of the minimum subset of genes
Selection.k$Measures        #return the selected features' information



