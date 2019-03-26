library(geoR)


### Name: matern
### Title: Computer Values of the Matern Correlation Function
### Aliases: matern
### Keywords: spatial

### ** Examples

#
# Models with fixed range and varying smoothness parameter
#
curve(matern(x, phi= 0.25, kappa = 0.5),from = 0, to = 1.5,
      xlab = "distance", ylab = expression(rho(h)), lty = 2,
      main=expression(paste("varying  ", kappa, "  and fixed  ", phi)))
curve(matern(x, phi= 0.25, kappa = 1),from = 0, to = 1.5, add = TRUE)
curve(matern(x, phi= 0.25, kappa = 2),from = 0, to = 1.5, add = TRUE,
      lwd = 2, lty=2)
curve(matern(x, phi= 0.25, kappa = 3),from = 0, to = 1.5, add = TRUE,
      lwd = 2)
legend("topright", expression(kappa==0.5, kappa==1.5, kappa==2, kappa==3),
    lty=c(2,1,2,1), lwd=c(1,1,2,2))

#
# Correlations with equivalent "practical range"
# and varying smoothness parameter
#
curve(matern(x, phi = 0.25, kappa = 0.5),from = 0, to = 1,
      xlab = "distance", ylab = expression(gamma(h)), lty = 2,
      main = "models with equivalent \"practical\" range")
curve(matern(x, phi = 0.188, kappa = 1),from = 0, to = 1, add = TRUE)      
curve(matern(x, phi = 0.14, kappa = 2),from = 0, to = 1,
      add = TRUE, lwd=2, lty=2)      
curve(matern(x, phi = 0.117, kappa = 2), from = 0, to = 1,
      add = TRUE, lwd=2)      
legend("topright", expression(list(kappa == 0.5, phi == 0.250),
       list(kappa == 1, phi == 0.188), list(kappa == 2, phi == 0.140),
       list(kappa == 3, phi == 0.117)), lty=c(2,1,2,1), lwd=c(1,1,2,2))



