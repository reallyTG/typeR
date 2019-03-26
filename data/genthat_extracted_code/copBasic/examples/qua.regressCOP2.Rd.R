library(copBasic)


### Name: qua.regressCOP2
### Title: Perform Quantile Regression using a Copula by Numerical
###   Derivative Method for U with respect to V
### Aliases: qua.regressCOP2
### Keywords: quantile regression

### ** Examples

## Not run: 
##D # Use a positively associated Plackett copula and perform quantile regression
##D theta <- 0.10
##D R <- qua.regressCOP2(cop=PLACKETTcop, para=theta) # 50th percentile regression
##D plot(R$U,R$V, type="l", lwd=6, xlim=c(0,1), ylim=c(0,1), col=8)
##D lines((1+(theta-1)*R$V)/(theta+1),R$V, col=4, lwd=1) # theoretical for Plackett,
##D # compare the theoretical form to that in qua.regressCOP---just switch terms around
##D # because of symmetry
##D R <- qua.regressCOP2(f=0.90, cop=PLACKETTcop, para=theta) # 90th-percentile regression
##D lines(R$U,R$V, col=2, lwd=2)
##D R <- qua.regressCOP2(f=0.10, cop=PLACKETTcop, para=theta) # 10th-percentile regression
##D lines(R$U,R$V, col=2, lty=2)
##D mtext("Quantile Regression U wrt V for Plackett copula")#
## End(Not run)



