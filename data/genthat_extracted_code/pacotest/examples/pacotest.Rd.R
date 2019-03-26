library(pacotest)


### Name: pacotest
### Title: Testing for the Partial Copula and the Simplifying Assumption
###   for a Single Bivariate Conditional Copula
### Aliases: pacotest

### ** Examples

#####################
# Generate an options list, e.g., the constant conditional correlation (CCC)
# test with default options.
pacotestOptions=pacotestset(testType='CCC')

#####################
# Use the specified options to test for the simplifying assumption

##### Example 1: Non-simplified three-dim. C-Vine #####
# Simulate from a three-dimensional C-Vine copula with C_12 and C_13
# being product copulas and C_23|1 being a Frank copula with
# functional parameter theta(x_{1}) = (4x_{1}-2)^3
N = 500
X = matrix(runif(3*N),N,3)
theta = (4*X[,1]-2)^3

etheta = expm1(-theta);
X[,3] = -1/theta*log(1+etheta/(exp(-theta*X[,2])*(1/X[,3]-1)+1));

Result = pacotest(X[,c(2,3)],X[,1],pacotestOptions)
Result$pValue

##### Example 2: Non-simplified three-dim. C-Vine #####
# Simulate from a three-dimensional C-Vine copula with C_12 and C_13
# being product copulas and C_23|1 being a Frank copula with
# functional parameter theta(x_{1}) = 12 + 8*sin(0.4(3x_{1}+2)^2)
X = matrix(runif(3*N),N,3)
theta = 12 + 8*sin(0.4*(3*X[,1]+2)^2)

etheta = expm1(-theta);
X[,3] = -1/theta*log(1+etheta/(exp(-theta*X[,2])*(1/X[,3]-1)+1));

Result = pacotest(X[,c(2,3)],X[,1],pacotestOptions)
Result$pValue

##### Example 3: Simplified three-dim. C-Vine #####
# Simulate from a three-dimensional C-Vine copula with C_12 and C_13
# being Clayton copulas with prameter theta and C_23|1 being a Clayton copula with
# functional parameter theta(x_{1}) = theta / (1+theta)
W = matrix(runif(3*N),N,3)
X = matrix(NA,N,3)
theta = 2

X[,1] = W[,1]
X[,2] = (W[,1]^(-theta)*(W[,2]^((-theta)/(1+theta))-1)+1)^(-1/theta);
theta_23_1 = theta /(1+theta)
X[,3] = (W[,2]^(-theta_23_1)*(W[,3]^((-theta_23_1)/(1+theta_23_1))-1)+1)^(-1/theta_23_1);
X[,3] = (W[,1]^(-theta)*(X[,3]^((-theta)/(1+theta))-1)+1)^(-1/theta);

# Get Pseudo-Obs from the conditional copula C_23|1
U = matrix(NA,N,2)
U[,1] = (X[,1]^theta*(X[,2]^(-theta)-1)+1)^(-(1+theta)/theta);
U[,2] = (X[,1]^theta*(X[,3]^(-theta)-1)+1)^(-(1+theta)/theta);
Result = pacotest(U,X[,1],pacotestOptions)
Result$pValue



