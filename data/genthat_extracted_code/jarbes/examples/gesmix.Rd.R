library(jarbes)


### Name: gesmix
### Title: Generalized Evidence Synthesis with Indirect Penalization of
###   Observational Studies
### Aliases: gesmix

### ** Examples

## Not run: 
##D 
##D  library(jarbes)
##D  
##D out = gesmix(data = ppvipd)
##D attach.jags(out, overwrite = TRUE)
##D 
##D par(mfrow = c(1,2))
##D hist(lambda[,1],  breaks = 100, probability = TRUE,
##D     ylim = c(0, 3),
##D     xlim = c(-2, 0.85), main = "",
##D     xlab = "Treatment Effect: log(Odds Ratio)")
##D 
##D lines(density(lambda[,2]), lwd = 3, col = "red")
##D lines(density(lambda[,1]), lwd = 3, col = "blue")
##D abline(v = 0, lty = 2)
##D legend(-2, 3, legend = c("RCTs' Component",
##D                         "Obsevationals' Component"),
##D       col = c("blue", "red"),
##D       lty = rep(1, 2),
##D       lwd = rep(2, 2))
##D hist(c(lambda[,1],lambda[,2]+0.337), 
##D     breaks = 150,
##D     probability = TRUE,
##D     ylim = c(0, 3.5),
##D     xlim = c(-2.1, 0.2), main = "",
##D     xlab = "Treatment Effect: log(Odds Ratio)")
##D lines(density(c(lambda[,1],lambda[,2]+0.337)), col = "blue", lwd =3)
##D abline(v = quantile(c(lambda[,1],lambda[,2]+0.337), 
##D                    probs = c(0.025,0.5,0.975)), col ="blue",
##D       lty = 2)
##D m.pool <- log(0.43)
##D sd.pool <- (log(0.54) - log(0.34))/(2*1.96)
##D curve(dnorm(x, m = m.pool, s = sd.pool), 
##D      from = -3, to = 0.5, add = TRUE, col = "black", lwd =3)
##D legend(-2.1, 3, 
##D       legend = c("Bias-adjusted",
##D                  "Biased result"),
##D       col = c("blue", "black"),
##D       lty = rep(1, 2),
##D       lwd = rep(2, 2))
##D abline(v = 0, lty = 2)
##D arrows(-1.5, 1.1, -1, 1.55, lwd =2, length=0.1, angle=20)
##D text(-1.8, 1, "Ignoring study types")
##D par(mfrow = c(1,1))
## End(Not run)



