library(copBasic)


### Name: P
### Title: The Product (Independence) Copula
### Aliases: P
### Keywords: copula (formulas) copula

### ** Examples

P(c(0.4,0,1),c(0,0.6,1))
## Not run: 
##D n <- 100000 # giant sample size, L-comoments are zero
##D # PERFECT INDEPENDENCE
##D UV <- simCOP(n=n, cop=P, graphics=FALSE)
##D lmomco::lcomoms2(UV, nmom=4)
##D # The following are Taus_r^{12} and Taus_r^{21}
##D # L-corr:        0.00265 and  0.00264 ---> ZERO
##D # L-coskew:     -0.00121 and  0.00359 ---> ZERO
##D # L-cokurtosis:  0.00123 and  0.00262 ---> ZERO
##D 
##D # MODEST POSITIVE CORRELATION
##D rho <- 0.5; # Spearman's Rho
##D theta <- PLACKETTpar(rho=0.5) # Theta = 5.115658
##D UV <- simCOP(n=n, cop=PLACKETTcop, para=theta, graphics=FALSE)
##D lmomco::lcomoms2(UV, nmom=4)
##D # The following are Taus_r^{12} and Taus_r^{21}
##D # L-corr        0.50136 and  0.50138 ---> Pearson R = Spearman Rho
##D # L-coskews    -0.00641 and -0.00347 ---> ZERO
##D # L-cokurtosis -0.00153 and  0.00046 ---> ZERO
## End(Not run)



