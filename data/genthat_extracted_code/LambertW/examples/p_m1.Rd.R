library(LambertW)


### Name: p_m1
### Title: Non-principal branch probability
### Aliases: p_m1
### Keywords: univar

### ** Examples


beta.01 <- c(mu = 0, sigma = 1)
# for n=1 observation
p_m1(0, beta = beta.01, distname = "normal") # identical to 0
# in theory != 0; but machine precision too low
p_m1(0.01, beta = beta.01, distname = "normal") 
p_m1(0.05, beta = beta.01, distname = "normal") # extremely small
p_m1(0.1, beta = beta.01, distname = "normal") # != 0, but very small
# 1 out of 4 samples is a non-principal input;
p_m1(1.5, beta = beta.01, distname = "normal") 
# however, gamma=1.5 is not common in practice

# for n=100 observations
p_m1(0, n=100, beta = beta.01, distname = "normal") # == 0
p_m1(0.1, n=100, beta = beta.01, distname = "normal") # still small
p_m1(0.3, n=100, beta = beta.01, distname = "normal") # a bit more likely
p_m1(1.5, n=100, beta = beta.01, distname = "normal") 
# Here we can be almost 100% sure (rounding errors) that at least one
# y_i was caused by an input in the non-principal branch.




