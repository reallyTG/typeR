library(copBasic)


### Name: qua.regressCOP
### Title: Perform Quantile Regression using a Copula by Numerical
###   Derivative Method for V with respect to U
### Aliases: qua.regressCOP
### Keywords: quantile regression

### ** Examples

## Not run: 
##D # Use a positively associated Plackett copula and perform quantile regression
##D theta <- 10
##D R <- qua.regressCOP(cop=PLACKETTcop, para=theta) # 50th percentile regression
##D 
##D plot(R$U,R$V, type="l", lwd=6, xlim=c(0,1), ylim=c(0,1), col=8)
##D lines(R$U,(1+(theta-1)*R$U)/(theta+1), col=4, lwd=1) # theoretical for Plackett, see
##D #                                                             (Nelsen, 2006, p. 218)
##D R <- qua.regressCOP(f=0.90, cop=PLACKETTcop, para=theta) # 90th-percentile regression
##D lines(R$U,R$V, col=2, lwd=2)
##D R <- qua.regressCOP(f=0.10, cop=PLACKETTcop, para=theta) # 10th-percentile regression
##D lines(R$U,R$V, col=3, lty=2)
##D mtext("Quantile Regression V wrt U for Plackett copula")#
## End(Not run)

## Not run: 
##D # Use a composite copula with two Placketts with compositing parameters alpha and beta.
##D para <- list(cop1=PLACKETTcop, cop2=PLACKETTcop,
##D              para1=0.04, para2=5, alpha=0.9, beta=0.6)
##D plot(c(0,1),c(0,1), type="n", lwd=3,
##D      xlab="U, NONEXCEEDANCE PROBABILITY", ylab="V, NONEXCEEDANCE PROBABILITY")
##D # Draw the regression of V on U and then U on V (wrtV=TRUE)
##D qua.regressCOP.draw(cop=composite2COP, para=para, ploton=FALSE)
##D qua.regressCOP.draw(cop=composite2COP, para=para, wrtV=TRUE, lty=2, ploton=FALSE)
##D mtext("Composition of Two Plackett Copulas and Quantile Regression")#
## End(Not run)

## Not run: 
##D # Use a composite copula with two Placketts with compositing parameters alpha and beta.
##D para <- list(cop1=PLACKETTcop,  cop2=PLACKETTcop,
##D              para1=0.34, para2=50, alpha=0.63, beta=0.47)
##D D <- simCOP(n=3000, cop=composite2COP, para=para, cex=0.5)
##D qua.regressCOP.draw(cop=composite2COP, para=para, ploton=FALSE)
##D qua.regressCOP.draw(cop=composite2COP, para=para, wrtV=TRUE, lty=2, ploton=FALSE)
##D level.curvesCOP(cop=composite2COP, para=para, ploton=FALSE)
##D mtext("Composition of Two Plackett Copulas, Level Curves, Quantile Regression")
##D 
##D para <- list(cop1=PLACKETTcop,  cop2=PLACKETTcop, # Note the singularity
##D              para1=0, para2=500, alpha=0.63, beta=0.47)
##D D <- simCOP(n=3000, cop=composite2COP, para=para, cex=0.5)
##D qua.regressCOP.draw(cop=composite2COP, para=para, ploton=FALSE)
##D qua.regressCOP.draw(cop=composite2COP, para=para, wrtV=TRUE, lty=2, ploton=FALSE)
##D level.curvesCOP(cop=composite2COP, para=para, ploton=FALSE)
##D mtext("Composition of Two Plackett Copulas, Level Curves, Quantile Regression")
##D 
##D pdf("quantile_regression_test.pdf")
##D for(i in 1:10) {
##D   para <- list(cop1=PLACKETTcop, cop2=PLACKETTcop, alpha=runif(1), beta=runif(1),
##D                para1=10^runif(1,min=-4,max=0), para2=10^runif(1,min=0,max=4))
##D   txts <- c("Alpha=",    round(para$alpha,    digits=4),
##D             "; Beta=",   round(para$beta,     digits=4),
##D             "; Theta1=", round(para$para1[1], digits=5),
##D             "; Theta2=", round(para$para2[1], digits=2))
##D 
##D   D <- simCOP(n=3000, cop=composite2COP, para=para, cex=0.5, col=3)
##D   mtext(paste(txts, collapse=""))
##D   qua.regressCOP.draw(f=c(seq(0.05, 0.95, by=0.05)),
##D                       cop=composite2COP, para=para, ploton=FALSE)
##D   qua.regressCOP.draw(f=c(seq(0.05, 0.95, by=0.05)),
##D                       cop=composite2COP, para=para, wrtV=TRUE, ploton=FALSE)
##D   level.curvesCOP(cop=composite2COP, para=para, ploton=FALSE)
##D }
##D dev.off() # done
## End(Not run)



