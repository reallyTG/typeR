library(metagen)


### Name: dvec
### Title: Data generation: Sampling data of clinical trials
### Aliases: dvec

### ** Examples

h_test <- .03
x_test <- cbind(1,1:13)
b_test <- c(0.02, 0.03)
s_test <- rep(2000, 13)
a_test <- rep(.3, 13)
rBinomGauss(  h=h_test, s=s_test, a=a_test, r=0.03
            , x=x_test, b=b_test)$study -> test
yvec(test)
dvec(test)



