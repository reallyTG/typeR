library(fergm)


### Name: compare_predictions
### Title: Compare predictions of ERGM to FERGM.
### Aliases: compare_predictions
### Keywords: Fit GOF Prediction.

### ** Examples

# load example data
library(fergm)
data("ergm.fit")
data("fergm.fit")

# Use built in compare_predictions function to compare predictions of ERGM and FERGM,
# few replications due to example
# Make sure "net" is an object defined in the global environment.
net <- ergm.fit$network
predict_out <- compare_predictions(ergm.fit = ergm.fit, fergm.fit = fergm.fit,
                                   replications = 10, seed=12345)

# Use the built in compare_predictions_plot function to examine the densities of
#  correctly predicted ties from the compare_predictions simulations
compare_predictions_plot(predict_out)

# We can also conduct a KS test to determine if the FERGM fit
     # it statistically disginguishable from the ERGM fit
compare_predictions_test(predict_out)



