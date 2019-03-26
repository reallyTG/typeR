library(fergm)


### Name: compare_predictions_test
### Title: KS Test for Difference in Predictive Performance
### Aliases: compare_predictions_test
### Keywords: Fit GOF KS Kolmogorov-Smirnov Prediction Test

### ** Examples

# load example data
data("ergm.fit")
data("fergm.fit")
data("mesa")
# Use built in compare_predictions function to compare predictions of ERGM and FERGM,
# few replications due to example
 net <- ergm.fit$network
predict_out <- compare_predictions(ergm.fit = ergm.fit, fergm.fit = fergm.fit,
                                   replications = 10, seed = 12345)

# We can also conduct a KS test to determine if the FERGM fit it statistically
 # distinguishable from the ERGM fit
compare_predictions_test(predict_out)



