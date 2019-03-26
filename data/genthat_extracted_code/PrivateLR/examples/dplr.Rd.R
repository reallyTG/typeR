library(PrivateLR)


### Name: PrivateLR
### Title: Differentially Private Logistic Regression
### Aliases: PrivateLR dplr dplr.formula dplr.numeric dplr.factor
###   dplr.logical dplr.data.frame dplr.matrix predict.dplr summary.dplr
###   print.summary.dplr print.dplr scaled
### Keywords: models regression privacy

### ** Examples

data(iris)

# the following two are equivalent
# and predict Species being any 
# but the first factor level.
model <- dplr(iris)
model <- dplr(Species ~ ., iris)

# pick a particular factor level and privacy level 2
model <- dplr(I(Species != 'setosa') ~ ., iris, eps=2)

# The following is again equivalent to the two first
# examples. Note that we need to remove 'Species' from the
# covariate matrix/data frame, and
# that the class reported by summary will now
# not be 'Species' but 'dplr.class'.
model <- dplr(iris$Species, iris[,-5])

# two equivalent methods to get at the predicted
# probabilities
p <- model$pred(iris)
p <- predict(model, iris)

# print a summary of the model. Note that
# only the coefficients are guaranteed
# to be generated in an eps-differentially
# private manner.
summary(model)



