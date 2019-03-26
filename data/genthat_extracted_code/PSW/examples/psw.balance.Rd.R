library(PSW)


### Name: psw.balance
### Title: Balance checking using standardized mean difference
### Aliases: psw.balance

### ** Examples

# Load the test data set
data(test_data);
# Propensity score model
form.ps <- "Z ~ X1 + X2 + X3 + X4";
# A vector of covariates
V.name <- c( "X1", "X2", "X3", "X4" );
tmp <- psw.balance( data = test_data, weight = "MW", form.ps = form.ps,
V.name = V.name );




