library(PSW)


### Name: psw
### Title: Propensity score weighting
### Aliases: psw

### ** Examples

# Load the test data set
data(test_data);

# Propensity score model
form.ps <- "Z ~ X1 + X2 + X3 + X4";

# A vector of covariates
V.name <- c( "X1", "X2", "X3", "X4" );

#1. Standardized differnce with "ATE"
tmp1 <- psw( data = test_data, form.ps = form.ps, weight = "ATE",
std.diff = TRUE,  V.name = V.name );

#2. Mirror histogram and add estimated matching weight to it
tmp2 <- psw( data = test_data, form.ps = form.ps, weight = "MW",
mirror.hist = TRUE, add.weight = TRUE );

#3. Estimate average treatment effect with "ATE"
tmp3 <- psw( data = test_data, form.ps = form.ps, weight = "ATE", wt = TRUE,
out.var = "Y", family = "gaussian" );

#4. Augmented estimator with "OVERLAP"
# outcome model
form.out <- "Y ~ X1 + X2 + X3 + X4";
tmp4 <- psw( data = test_data, form.ps = form.ps, weight = "OVERLAP", aug = TRUE,
form.outcome = form.out, family = "gaussian" );

#5. Propensity score model specification test with "MW".
# A vector of transformation types for covariates in V.name.
trans.type <- c( "identity", "identity", "logit", "logit" );
tmp5 <- psw( data = test_data, form.ps = form.ps, weight = "MW", spec.test = TRUE,
V.name = V.name, trans.type = trans.type );




