library(qcc)


### Name: qcc.overdispersion.test
### Title: Overdispersion test for binomial and poisson data
### Aliases: qcc.overdispersion.test
### Keywords: htest

### ** Examples

# data from Wetherill and Brown (1991) pp. 212--213, 216--218:
x <- c(12,11,18,11,10,16,9,11,14,15,11,9,10,13,12,
       8,12,13,10,12,13,16,12,18,16,10,16,10,12,14)
size <- rep(50, length(x))
qcc.overdispersion.test(x,size)

x <- c(11,8,13,11,13,17,25,23,11,16,9,15,10,16,12,
       8,9,15,4,12,12,12,15,17,14,17,12,12,7,16)
qcc.overdispersion.test(x)



