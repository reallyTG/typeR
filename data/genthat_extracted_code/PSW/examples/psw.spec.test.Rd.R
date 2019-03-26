library(PSW)


### Name: psw.spec.test
### Title: Propensity score model specification test
### Aliases: psw.spec.test

### ** Examples

# Load the test data set
data(test_data);
# Propensity score model
form.ps <- "Z ~ X1 + X2 + X3 + X4";
# A vector of covariates
V.name <- c( "X1", "X2", "X3", "X4" );
# A vector of transformation types for covariates in V.name.
trans.type <- c( "identity", "identity", "logit", "logit" );
tmp <- psw.spec.test( data = test_data, form.ps = form.ps,
weight = "MW", V.name = V.name, trans.type = trans.type );




