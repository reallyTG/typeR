library(lmomco)


### Name: quagep
### Title: Quantile Function of the Generalized Exponential Poisson
###   Distribution
### Aliases: quagep
### Keywords: distribution quantile function Distribution: Generalized
###   Exponential Poisson

### ** Examples

gep <- list(para=c(2, 1.5, 3), type="gep")
quagep(0.5, gep)
## Not run: 
##D   pdf("gep.pdf")
##D   F <- nonexceeds(f01=TRUE)
##D   K <- seq(-1,2,by=.2); H <- seq(-1,2,by=.2)
##D   K <- 10^(K); H <- 10^(H)
##D   for(i in 1:length(K)) {
##D     for(j in 1:length(H)) {
##D       gep <- vec2par(c(2,K[i],H[j]), type="gep")
##D       message("(K,H): ",K[i]," ",H[j])
##D       plot(F, quagep(F, gep), lty=i, col=j, type="l", ylim=c(0,4),
##D            xlab="NONEXCEEDANCE PROBABILITY", ylab="X(F)")
##D       mtext(paste("(K,H): ",K[i]," ",H[j]))
##D     }
##D   }
##D   dev.off()
## End(Not run)



