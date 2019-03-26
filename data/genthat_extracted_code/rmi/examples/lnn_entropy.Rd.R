library(rmi)


### Name: lnn_entropy
### Title: Local Nearest Neighbor (LNN) Entropy Estimator
### Aliases: lnn_entropy

### ** Examples

set.seed(123)
x <- rnorm(1000)
print(lnn_entropy(x))
#analytic entropy
print(0.5*log(2*pi*exp(1)))




