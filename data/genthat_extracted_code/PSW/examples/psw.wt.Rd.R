library(PSW)


### Name: psw.wt
### Title: Propensity score weighting estimator
### Aliases: psw.wt

### ** Examples

# Load the test data set
data(test_data);
# Propensity score model
form.ps <- "Z ~ X1 + X2 + X3 + X4";
tmp <- psw.wt( data = test_data, weight = "ATE", form.ps = form.ps,
out.var = "Y", family = "gaussian" );




