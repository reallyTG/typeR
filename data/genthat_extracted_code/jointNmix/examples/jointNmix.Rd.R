library(jointNmix)


### Name: jointNmix
### Title: Joint N-mixture models
### Aliases: jointNmix

### ** Examples

## simulating data with poisson latent abundances
R <- 10 # sites
T <- 10 # time occasions
lambda1 <- 5
psi <- 3
p1 <- .3
p2 <- .6
lambda2 <- .5
set.seed(1234); N1 <- rpois(R, lambda1)
set.seed(1234); N2 <- rpois(R, psi + lambda2*N1)
y1 <- y2 <- matrix(0, ncol=T, nrow=R)
set.seed(1234); for(i in 1:R) y1[,i] <- rbinom(T, N1, p1)
set.seed(1234); for(i in 1:R) y2[,i] <- rbinom(T, N2, p2)

Xp <- cbind(rep(1, R*T))
Xl <- cbind(rep(1, R))

## Not run: 
##D ## fitting the Poisson-Poisson joint N-mixture model
##D fitpp <- jointNmix(y1, y2, Xp1=Xp, Xp2=Xp, Xl1=Xl, Xl2=Xl, mixture=c("P","P"), K=30)
##D 
##D ## fitting the negbin-Poisson joint N-mixture model
##D fitnbp <- jointNmix(y1, y2, Xp1=Xp, Xp2=Xp, Xl1=Xl, Xl2=Xl, mixture=c("NB","P"), K=30)
##D 
##D ## likelihood-ratio test between P-P and NB-P models
##D anova(fitpp, fitnbp)
##D 
##D ## comparing using AIC
##D lapply(list(fitpp, fitnbp), AIC)
##D 
##D ## conditional posterior probability functions for abundances
##D plot(fitpp, posterior = TRUE)
##D 
##D ## estimated abundances vs. true abundances
##D data.frame(getranef.jointNmix(fitpp), N1, N2)
##D   
## End(Not run)



