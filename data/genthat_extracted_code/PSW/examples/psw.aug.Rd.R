library(PSW)


### Name: psw.aug
### Title: Propensity score weighting with augmented estimation
### Aliases: psw.aug

### ** Examples

# Load the test data set
data(test_data);
# Propensity score model
form.ps <- "Z ~ X1 + X2 + X3 + X4";
# Outcome model
form.out <- "Y ~ X1 + X2 + X3 + X4";
tmp <- psw.aug( data = test_data, form.ps = form.ps, weight = "ATE",
form.outcome = form.out, family="gaussian" );




