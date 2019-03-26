library(lmomco)


### Name: pdfgep
### Title: Probability Density Function of the Generalized Exponential
###   Poisson Distribution
### Aliases: pdfgep
### Keywords: distribution probability density function Distribution:
###   Generalized Exponential Poisson

### ** Examples

pdfgep(0.5, vec2par(c(10,2.9,1.5), type="gep"))
## Not run: 
##D x <- seq(0,3, by=0.01); ylim <- c(0,1.5)
##D plot(NA,NA, xlim=range(x), ylim=ylim, xlab="x", ylab="f(x)")
##D mtext("Barreto-Souza and Cribari-Neto (2009, fig. 1)")
##D K <- c(0.1, 1, 5, 10)
##D for(i in 1:length(K)) {
##D    gep <- vec2par(c(2,K[i],1), type="gep"); lines(x, pdfgep(x, gep), lty=i)
##D }
## End(Not run)



