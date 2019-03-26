library(learningCurve)


### Name: cum_error
### Title: Approximate Prediction Error
### Aliases: cum_error

### ** Examples

# An estimator is predicting hours for a block of 250 units. Historically,
# the organization has had a learning rate between 85-87%. What is the
# potential error in the prediction by using one of these two learning
# rates (85% vs. 87%)? If you go with a learning rate of 85% and the
# organization performs at a learning rate of 87% then the error would
# be 20%.

cum_error(n = 250, r1 = .85, r2 = .87)
## [1] 0.2035303




