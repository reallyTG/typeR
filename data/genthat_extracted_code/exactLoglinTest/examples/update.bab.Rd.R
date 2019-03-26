library(exactLoglinTest)


### Name: update.bab
### Title: Update method for objects of class bab
### Aliases: update.bab bab
### Keywords: htest

### ** Examples

data(residence.dat)
mcx <- mcexact(y ~ res.1985 + res.1980 + factor(sym.pair), data = residence.dat) 
summary(mcx)
mcx <- update(mcx, nosim = 10 ^ 4, maxiter = 10 ^ 6)
summary(mcx)



