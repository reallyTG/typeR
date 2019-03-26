library(OCA)


### Name: Risk
### Title: Risk measures suchs as Value at Risk (VaR) and Expected
###   Shortfall (ES) with normal and t-student distributions.
### Aliases: Risk
### Keywords: manip

### ** Examples


# Reproducing Table 2.1 in page 47 of 
# McNeal A., Frey R. and Embrechts P (2005).
 alpha <- c(.90, .95, .975, .99, .995)
 (Risk(Loss=1, varcov=(0.2/sqrt(250))^2, alpha=alpha, 
       measure='both', model='both', df=4)-1)*10000
 
 # only VaR results
 (Risk(Loss=1, varcov=(0.2/sqrt(250))^2, alpha=alpha, 
       measure='VaR', model='both', df=4)-1)*10000
 
 # only normal VaR results
 (Risk(Loss=1, varcov=(0.2/sqrt(250))^2, alpha=alpha)-1)*10000
 
 # only SE based on a 4 degrees t-student.
 (Risk(Loss=1, varcov=(0.2/sqrt(250))^2, alpha=alpha, 
       measure='ES', model='t-student', df=4)-1)*10000



