library(isocir)


### Name: CIRE
### Title: Circular Isotonic Regresssion Estimator
### Aliases: CIRE
### Keywords: circular isotonic order CIRE

### ** Examples


# We consider the following data from the package that are random circular data:
data(cirdata)
circular_ordered_estimator <- CIRE(cirdata)
# We can take the vector of the CIRE estimators:
circular_ordered_estimator $CIRE
# And the SCE:
circular_ordered_estimator $SCE

# Random data with a more complex order:
CIRE(cirdata, groups=c(1,1,2,3,5,3,4,6))




