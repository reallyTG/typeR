library(VariableScreening)


### Name: screenVCM
### Title: Perform screening for ultrahigh-dimensional varying coefficient
###   model
### Aliases: screenVCM
### Keywords: Variable dimensional models, regression screening, ultra-high
###   varying-coefficient

### ** Examples

set.seed(12345678)
data1 <- simulateVCM(p=250,trueIdx = c(2, 20, 80, 120, 200))
screenResults<- screenVCM(X = data1$X, Y = data1$Y, U = data1$U)
rank <- screenResults$rank
print(which(rank <= 10))    # This prints the numbers of the columns having the best rank.
trueIdx <- c(2, 20, 80, 120, 200)   # These were the column numbers (indices) of
                                     # the nonnull predictors in the simulated data;
print(rank[trueIdx])    # It can be seen that these predictors were all given high rank,
                        # showing that the function worked well.;



