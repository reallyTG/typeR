library(ddst)


### Name: ddst.exp.test
### Title: Data Driven Smooth Test for Exponentiality
### Aliases: ddst.exp.test ddst.exp.Nk
### Keywords: htest nonparametric

### ** Examples


# H0 is true
z = rexp(80,4)
ddst.exp.test (z, compute.p = TRUE)

# H0 is false
z = rchisq(80,4)
(t = ddst.exp.test (z, compute.p = TRUE))
t$p.value




