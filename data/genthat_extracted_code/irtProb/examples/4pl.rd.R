library(irtProb)


### Name: 4pl
### Title: One, Two, Three and Four Parameters Logistic Distributions
### Aliases: p4pl q4pl d4pl r4pl
### Keywords: distribution

### ** Examples

## ....................................................................
# probability of a correct response
 p4pl(theta = 3, b = 0)
 
# Verification of the approximation of N(0,1) by a logistic (D=1.702)
 a <- 1; b <- 0; c <- 0; d <- 1; theta <- seq(-4, 4, length = 100)
 
# D constant 1.702 gives an approximation of a N(0,1) by a logistic
 prob.irt  <- p4pl(theta, a*1.702, b, c, d)
 prob.norm <- pnorm(theta, 0, 1)
 plot(theta, prob.irt)
 lines(theta, prob.norm, col = "red")
 
# Maximal difference between the two functions: less than 0.01
 max(prob.irt - prob.norm)
 
# Recovery of the value of the probability of a correct response p4pl()
# from the quantile value q4pl()
 p4pl(theta = q4pl(p = 0.20))

# Recovery of the quantile value from the probability of a correct
# response
 q4pl(p=p4pl(theta=3))

# Density Functions [derivative of p4pl()]
 d4pl(theta = 3, a = 1.702)
 theta   <- seq(-4, 4, length = 100)
 a       <- 3.702; b <- 0; c <- 0; d <- 1
 density <- d4pl(theta = theta, a = a, b = b, c = c, d = d)
 label   <- expression("Density - First Derivative")
 plot(theta, density, ylab = label, col = 1, type = "l")
 lines(theta, dnorm(x = theta, sd = 1.702/a), col = "red", type = "l")

## Generation of proficiency levels from r4pl() according to a N(0,1)
 data <- r4pl(N = 10000, a = 1.702, b = 0, c = 0, d = 1)
 c(mean = mean(data), sd = sd(data))
## ....................................................................



