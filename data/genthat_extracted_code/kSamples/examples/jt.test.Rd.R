library(kSamples)


### Name: jt.test
### Title: Jonckheere-Terpstra k-Sample Test for Increasing Alternatives
### Aliases: jt.test
### Keywords: nonparametric htest design

### ** Examples

x1 <- c(1,2)
x2 <- c(1.5,2.1)
x3 <- c(1.9,3.1)
yy <- c(x1,x2,x3)
gg <- as.factor(c(1,1,2,2,3,3))
jt.test(x1, x2, x3,method="exact",Nsim=90)
# or 
# jt.test(list(x1, x2, x3), method = "exact", Nsim = 90)
# or
# jt.test(yy ~ gg, method = "exact", Nsim = 90)



