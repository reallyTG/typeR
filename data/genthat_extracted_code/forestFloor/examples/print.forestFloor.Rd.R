library(forestFloor)


### Name: print.forestFloor
### Title: print summary of forestFloor.Object
### Aliases: print.forestFloor print.forestFloor_regression
###   print.forestFloor_multiClass print.forestFloor_classification

### ** Examples

## Not run: 
##D #simulate data
##D obs=1000 
##D vars = 6 
##D X = data.frame(replicate(vars,rnorm(obs))) 
##D Y = with(X, X1^2 + sin(X2*pi) + 2 * X3 * X4 + 0.5 * rnorm(obs)) 
##D 
##D #grow a forest, remeber to include inbag
##D rfo=randomForest::randomForest(X,Y,keep.inbag=TRUE)
##D 
##D #compute topology
##D ff = forestFloor(rfo,X)
##D 
##D #print forestFloor
##D print(ff) 
## End(Not run)



