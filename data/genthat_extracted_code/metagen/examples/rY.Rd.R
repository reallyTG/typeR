library(metagen)


### Name: rY
### Title: Data generation: Gaussian-Gaussian model
### Aliases: rY

### ** Examples

x_test = cbind(1,1:13)
h_test = .03
d_test = rchisq(13, df=0.02)
b_test = c(0.02, 0.03)
rY(n=10, h=h_test, d=d_test, x=x_test, b=b_test)



