library(OCA)


### Name: ES
### Title: Expected Shortfall
### Aliases: ES
### Keywords: manip

### ** Examples

# Exercise 2.21, page 46 in McNeil et al (2005) 
alpha <- c(.90, .95, .975, .99, .995) 
(ES(Loss=1, varcov=(0.2/sqrt(250))^2, alpha=alpha, model='normal')-1)*10000
(ES(Loss=1, varcov=(0.2/sqrt(250))^2, alpha=alpha, model='t-student', df=4)-1)*10000

# Both type of models at once.
(ES(Loss=1, varcov=(0.2/sqrt(250))^2, alpha=alpha, model='both', df=4)-1)*10000

# A vector of losses
L <- c(10,40)                           # a vector of two (mean) losses
varcov <- matrix(c(100,150,150,900), 2) # covariance matrix
w <- c(0.5, 0.5)                        # a vector weights
ES(Loss=L, varcov=varcov, weights=w, alpha=0.95) 



