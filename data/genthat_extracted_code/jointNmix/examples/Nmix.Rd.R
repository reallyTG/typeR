library(jointNmix)


### Name: Nmix
### Title: Univariate N-mixture models
### Aliases: Nmix

### ** Examples

## simulating data with negative binomial latent abundances
R <- 10 # sites
T <- 10 # time occasions
lambda <- 5 # abundance parameter
p <- .3 # probability of detection
phi <- 1 # dispersion parameter
set.seed(1234); Ni <- rnbinom(R, mu=lambda, size=phi) # latent abundances
y <- matrix(0, ncol=T, nrow=R)
set.seed(1234); for(i in 1:R) y[,i] <- rbinom(T, Ni, p) # observed abundances

## fitting the Poisson N-mixture model
fitp <- Nmix(y, Xp=cbind(rep(1, R*T)), Xl=cbind(rep(1, R)), mixture="P", K=25)

## fitting the negative binomial N-mixture model
fitnb <- Nmix(y, Xp=cbind(rep(1, R*T)), Xl=cbind(rep(1, R)), mixture="NB", K=25)

## fitting the Neyman-A N-mixture model
fitna <- Nmix(y, Xp=cbind(rep(1, R*T)), Xl=cbind(rep(1, R)), mixture="NeymanA", K=25)

## likelihood-ratio test between Poisson and negbin models
anova(fitp, fitnb)

## comparing using AIC
lapply(list(fitp, fitnb, fitna), AIC)

## conditional posterior probability functions for abundances
plot(fitnb, posterior = TRUE)

## estimated abundances vs. true abundances
data.frame(getranef.uniNmix(fitnb), Ni)



