library(kulife)


### Name: auc
### Title: Compute the area under the curve for two vectors.
### Aliases: auc
### Keywords: ~kwd1 ~kwd2

### ** Examples

x <- 1:4
y <- c(0, 1, 1, 5)
auc(x, y)

# AUC from 0 to max(x) where we allow for extrapolation
auc(x, y, from=0, rule=2)    

# Use value 0 to the left
auc(x, y, from=0, rule=2, yleft=0)

# Use 1/2 to the left
auc(x, y, from=0, rule=2, yleft=.5)



