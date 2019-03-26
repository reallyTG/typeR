library(ddst)


### Name: ddst.uniform.test
### Title: Data Driven Smooth Test for Uniformity
### Aliases: ddst.uniform.test ddst.uniform.Nk
### Keywords: htest nonparametric

### ** Examples


# H0 is true
z = runif(80)
ddst.uniform.test(z, compute.p=TRUE)

# known fixed alternative
z = rnorm(80,10,16)
ddst.uniform.test(pnorm(z, 10, 16), compute.p=TRUE)


# H0 is false
z = rbeta(80,4,2)
(t = ddst.uniform.test(z, compute.p=TRUE))
t$p.value




