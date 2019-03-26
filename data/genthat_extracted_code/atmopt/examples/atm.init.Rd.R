library(atmopt)


### Name: atm.init
### Title: Initializing ATM object
### Aliases: atm.init

### ** Examples

nfact <- 9 #number of factors
lev <- 4
nlev <- rep(lev,nfact) #number of levels for each factor
fit <- atm.init(nfact,nlev) #initialize ATM object



