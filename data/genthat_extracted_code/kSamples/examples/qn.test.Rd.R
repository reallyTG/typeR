library(kSamples)


### Name: qn.test
### Title: Rank Score k-Sample Tests
### Aliases: qn.test
### Keywords: nonparametric htest design

### ** Examples

u1 <- c(1.0066, -0.9587,  0.3462, -0.2653, -1.3872)
u2 <- c(0.1005, 0.2252, 0.4810, 0.6992, 1.9289)
u3 <- c(-0.7019, -0.4083, -0.9936, -0.5439, -0.3921)
yy <- c(u1, u2, u3)
gy <- as.factor(c(rep(1,5), rep(2,5), rep(3,5)))
set.seed(2627)
qn.test(u1, u2, u3, test="KW", method = "simulated", 
  dist = FALSE, Nsim = 1000)
# or with same seed
# qn.test(list(u1, u2, u3),test = "KW", method = "simulated", 
#  dist = FALSE, Nsim = 1000)
# or with same seed
# qn.test(yy ~ gy, test = "KW", method = "simulated", 
#  dist = FALSE, Nsim = 1000)



