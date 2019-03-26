library(dtree)


### Name: stable
### Title: Main function to calculate stability coefficients
### Aliases: stable

### ** Examples

## Not run: 
##D library(MASS) # for boston data
##D data(Boston)
##D stab.out <- stable(formula=medv ~.,data=Boston,
##D             methods=c("rpart"),samp.method="cv",
##D             tuneLength=2, n.rep=5, parallel=TRUE)
##D stab.out
## End(Not run)



