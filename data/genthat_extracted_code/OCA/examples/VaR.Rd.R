library(OCA)


### Name: VaR
### Title: Value at Risk
### Aliases: VaR
### Keywords: manip

### ** Examples

# Reproducing VaR from Table 2.1 in page 47 of 
# McNeal A., Frey R. and Embrechts P (2005).

alpha <- c(.90, .95, .975, .99, .995)
 (VaR(Loss=1, varcov=(0.2/sqrt(250))^2, alpha=alpha,
      model='both', df=4)-1)*10000
 
 # only normal VaR results
 (VaR(Loss=1, varcov=(0.2/sqrt(250))^2, alpha=alpha)-1)*10000
 
 # Same result using
  (Risk(Loss=1, varcov=(0.2/sqrt(250))^2, alpha=alpha)-1)*10000




