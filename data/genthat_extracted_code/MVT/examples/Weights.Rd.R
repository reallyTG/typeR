library(MVT)


### Name: Weights
### Title: Distribution of the weights from a multivariate t-distribution
### Aliases: Weights dweights pweights qweights
### Keywords: distribution

### ** Examples

data(companies)
fit <- studentFit(companies, family = Student(eta = .25))

# compute the 5% quantile from the estimated distribution of the weights
p <- fit$dims[2]
eta <- fit$eta
wts <- fit$weights
cutoff <- qweights(.05, eta = eta, dim = p, scaled = FALSE)

# identify observations with 'small' weights
n <- fit$dims[1]
which <- seq_len(n)[wts < cutoff]
which



