library(PSW)


### Name: psw.mirror.hist
### Title: Mirror histogram
### Aliases: psw.mirror.hist

### ** Examples

# Load the test data set
data(test_data);
# Propensity score model
form.ps <- "Z ~ X1 + X2 + X3 + X4";
tmp <- psw.mirror.hist( data = test_data, weight = "MW", form.ps = form.ps,
add.weight = TRUE );




