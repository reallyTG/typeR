library(metagen)


### Name: rB
### Title: Data generation: Log-risk-ration of a binomial-Gaussian model
### Aliases: rB

### ** Examples

h_test <- .03
x_test <- cbind(1,1:13)
b_test <- c(0.02, 0.03)
s_test <- rep(2000, 13)
a_test <- rep(.3, 13)
rB(n=10, h=h_test, s=s_test, a=a_test, r=.3, x=x_test, b=b_test)



