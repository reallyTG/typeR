library(gamlss.dist)


### Name: BNB
### Title: Beta Negative Binomial distribution for fitting a GAMLSS
### Aliases: BNB dBNB pBNB qBNB rBNB ZABNB dZABNB pZABNB qZABNB rZABNB
###   ZIBNB dZIBNB pZIBNB qZIBNB rZIBNB
### Keywords: distribution regression

### ** Examples

BNB()   # gives information about the default links for the beta negative binomial
# plotting the distribution
plot(function(y) dBNB(y, mu = 10, sigma = 0.5, nu=2), from=0, to=40, n=40+1, type="h")
# creating random variables and plot them 
tN <- table(Ni <- rBNB(1000, mu=5, sigma=0.5, nu=2))
r <- barplot(tN, col='lightblue')

ZABNB()
ZIBNB()
# plotting the distribution
plot(function(y) dZABNB(y, mu = 10, sigma = 0.5, nu=2, tau=.1),  
     from=0, to=40, n=40+1, type="h")
plot(function(y) dZIBNB(y, mu = 10, sigma = 0.5, nu=2, tau=.1),  
     from=0, to=40, n=40+1, type="h")
## Not run: 
##D library(gamlss)
##D data(species)
##D species <- transform(species, x=log(lake))
##D m6 <- gamlss(fish~ pb(x), sigma.fo=~1, data=species, family=BNB)
## End(Not run)



