library(ddst)


### Name: ddst-package
### Title: Data Driven Smooth Tests
### Aliases: ddst-package ddst.base.cos ddst.base.legendre ddst.IIC
###   ddst.phi ddst Nmax
### Keywords: package htest nonparametric

### ** Examples


# Data Driven Smooth Test for Uniformity
#
# H0 is true
z = runif(80)
ddst.uniform.test(z, compute.p=TRUE)

# H0 is false
z = rbeta(80,4,2)
(t = ddst.uniform.test(z, compute.p=TRUE))
t$p.value

# Data Driven Smooth Test for Normality
#
# H0 is true
z = rnorm(80)
ddst.norm.test(z, compute.p=TRUE)

# H0 is false
z = rexp(80,4)
ddst.norm.test(z, B=5000, compute.p=TRUE)

# Data Driven Smooth Test for Extreme Value Distribution
#
# H0 is true
#library(evd)
#z = -qgumbel(runif(100),-1,1)
#ddst.extr.test (z, compute.p = TRUE)

# H0 is false
z = rexp(80,4)
ddst.extr.test (z, compute.p = TRUE)

# Data Driven Smooth Test for Exponentiality
#
# H0 is true
z = rexp(80,4)
ddst.exp.test (z, compute.p = TRUE)

# H0 is false
z = rchisq(80,4)
ddst.exp.test (z, compute.p = TRUE)




