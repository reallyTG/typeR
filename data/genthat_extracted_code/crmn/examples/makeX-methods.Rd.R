library(crmn)


### Name: makeX-methods
### Title: Make X
### Aliases: makeX makeX,ANY,matrix-method
###   makeX,ExpressionSet,character-method makeX-methods

### ** Examples

data(mix)
makeX(mix, "runorder")
runorder <- mix$runorder
makeX(mix, model.matrix(~-1+runorder))



