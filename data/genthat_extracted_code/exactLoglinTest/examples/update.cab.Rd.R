library(exactLoglinTest)


### Name: update.cab
### Title: Update method for objects of class cab
### Aliases: update.cab cab
### Keywords: htest

### ** Examples

data(residence.dat)
mcx <- mcexact(y ~ res.1985 + res.1980 + factor(sym.pair),
               data = residence.dat,
               method = "cab",
               p = .5,
               batchsize = 100) 
summary(mcx)
mcx <- update(mcx, nosim = 10 ^ 4)
summary(mcx)



