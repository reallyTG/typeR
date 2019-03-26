library(RAMpath)


### Name: plot.RAMpath
### Title: Plot the path diagram according to RAM path and bridges or Plot
###   the vector field for the bivariate latent change score model
### Aliases: plot.RAMpath plot plot.blcs

### ** Examples

data(ex3)
test.blcs<-ramBLCS(ex3, 1:6, 7:12, ram.out=TRUE)
ramVF(test.blcs, c(0,80),c(0,80), length=.05, xlab='X', ylab='Y',scale=.5, ninterval=9)
plot(test.blcs, c(0,80),c(0,80), length=.05, xlab='X', ylab='Y',scale=.5, ninterval=9)



