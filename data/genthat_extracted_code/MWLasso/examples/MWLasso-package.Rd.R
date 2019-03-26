library(MWLasso)


### Name: MWLasso
### Title: Penalized Moving-Window Lasso Method for Genome-Wide Association
###   Studies
### Aliases: MWLasso MW_parameters
### Keywords: model fitting

### ** Examples

# In example 1, feature matrix X and response variable Y are randomly generated.
# Example 1:
n = 100
p = 200
X = matrix(rnorm(n*p, mean = 0, sd = 1), nrow = n, ncol = p)
X[2,1] = NA; X[80:90,1]= NA; 
Y =  rnorm(n, mean = 0, sd = 1)

number = 20
gamma2 = 0.1
d = 4
params = MW_parameters(X, Y, d, number, gamma2, method="linear")
lambda = params[1]
eta = params[2]
beta.hat = MWLasso(X, Y, lambda, eta, d, method="linear")

# In example 2, the nki70 dataset is from the "penalized" package
# (https://cran.r-project.org/web/packages/penalized/penalized.pdf).
# The response variable Y is "event", the disease indicator.
# The feature matrix X is "TSPYL5...C20orf46", the gene expression
# measurements of 70 prognostic genes.
# Example 2:
require("penalized")
data(nki70)
data = nki70
Y = data$event
data$time <- NULL
data$event <- NULL
data$Diam <- NULL
data$N <- NULL
data$ER <- NULL
data$Grade <- NULL
data$Age <- NULL
X = data.matrix(data)

number = 20
gamma2 = 0.1
d = 4
params = MW_parameters(X, Y, d, number, gamma2, method="linear")
lambda = params[1]
eta = params[2]
beta.hat = MWLasso(X, Y, lambda, eta, d, method="linear")



