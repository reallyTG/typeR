library(itree)


### Name: printcp
### Title: Displays CP table for Fitted itree Object
### Aliases: printcp
### Keywords: tree

### ** Examples

#rpart's examples:

z.auto <- itree(Mileage ~ Weight, car.test.frame)
printcp(z.auto)
## Not run: 
##D Regression tree:
##D itree(formula = Mileage ~ Weight, data = car.test.frame)
##D 
##D Variables actually used in tree construction:
##D [1] Weight
##D 
##D Root node error: 1354.6/60 = 22.576
##D 
##D         CP nsplit rel error  xerror     xstd 
##D 1 0.595349      0   1.00000 1.03436 0.178526
##D 2 0.134528      1   0.40465 0.60508 0.105217
##D 3 0.012828      2   0.27012 0.45153 0.083330
##D 4 0.010000      3   0.25729 0.44826 0.076998
## End(Not run)


