library(ssd)


### Name: ssd
### Title: Sample Size Determination (SSD) for Unordered Categorical Data
### Aliases: ssd

### ** Examples

# Scheme M1 for Balanced case
# Case1: k=5, using default d=0.2, and r=0.3 under M1
ssd(k = 5, scheme = 'M1')
# Case2: k=5, specify d and r as below under M1
ssd(k = 5, d = 0.3, r = 0.35, scheme = 'M1')
ssd(k = 5, d = 0.1, r = 0.2, scheme = 'M1')

# Scheme M2 for Balanced case
# If p1 and p2 are true parameters, the original method provides
# the exact sample size needed:
p1 <- c(0.10, 0.25, 0.30, 0.20, 0.15)
p2 <- c(0.17, 0.32, 0.36, 0.10, 0.05)
ssd(p1, p2)
# If p1 and p2 are estimates from pilot data, the output from 
# the "minimum difference" method will be also given if 
# the minimal difference cc is specified, while the output from 
# "correction" and 4 bootstrap methods are provided if m,
# the pilot sample size is also specified. One can change the  
# default value of Niter=500 
ssd(p1, p2, m = 100)
ssd(p1, p2, m = 40)
# Non-bootstrap estimates provide similar answers in this case. 
# The bootstrap median underestimates as it usually does, and 
# bootstrap 75th is better than 80th in this case for m=100. 
# With smaller m, bootstrap 80th method is better if p1 and p2 
# were true parameters.

# Scheme M2 for Unbalanced case
ssd(p1, p2, m = 100, ratio = 0.67)
# Bootstrap 75th method is better than 80th method for m=100.



