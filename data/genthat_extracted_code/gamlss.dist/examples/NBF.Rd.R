library(gamlss.dist)


### Name: NBF
### Title: Negative Binomial Family distribution for fitting a GAMLSS
### Aliases: NBF dNBF pNBF qNBF rNBF ZINBF dZINBF pZINBF qZINBF rZINBF
### Keywords: distribution regression

### ** Examples

NBF() # default link functions for the Negative Binomial Family 
# plotting the distribution
plot(function(y) dNBF(y, mu = 10, sigma = 0.5, nu=2 ), from=0, 
     to=40, n=40+1, type="h")
# creating random variables and plot them 
tN <- table(Ni <- rNBF(1000, mu=5, sigma=0.5, nu=2))
r <- barplot(tN, col='lightblue')
# zero inflated NBF
ZINBF() # default link functions  for the zero inflated NBF 
# plotting the distribution
plot(function(y) dZINBF(y, mu = 10, sigma = 0.5, nu=2, tau=.1 ), 
     from=0, to=40, n=40+1, type="h")
# creating random variables and plot them 
tN <- table(Ni <- rZINBF(1000, mu=5, sigma=0.5, nu=2, tau=0.1))
r <- barplot(tN, col='lightblue')
## Not run: 
##D library(gamlss)
##D data(species)
##D species <- transform(species, x=log(lake))
##D m6 <- gamlss(fish~poly(x,2), sigma.fo=~1, data=species, family=NBF, 
##D           n.cyc=200)
##D fitted(m6, "nu")[1]
## End(Not run)



