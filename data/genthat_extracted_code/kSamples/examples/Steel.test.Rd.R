library(kSamples)


### Name: Steel.test
### Title: Steel's Multiple Comparison Wilcoxon Tests
### Aliases: Steel.test
### Keywords: nonparametric htest design

### ** Examples

z1 <- c(103, 111, 136, 106, 122, 114)
z2 <- c(119, 100,  97,  89, 112,  86)
z3 <- c( 89, 132,  86, 114, 114, 125)
z4 <- c( 92, 114,  86, 119, 131,  94)
y <- c(z1, z2, z3, z4)
g <- as.factor(c(rep(1, 6), rep(2, 6), rep(3, 6), rep(4, 6)))
set.seed(2627)
Steel.test(list(z1, z2, z3, z4), method = "simulated", 
  alternative = "less", Nsim = 1000)
# or with same seed
# Steel.test(z1, z2, z3, z4,method = "simulated", 
#   alternative = "less", Nsim = 1000)
# or with same seed
# Steel.test(y ~ g, method = "simulated", 
#   alternative = "less", Nsim=1000)



