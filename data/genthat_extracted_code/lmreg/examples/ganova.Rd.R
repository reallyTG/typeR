library(lmreg)


### Name: ganova
### Title: ANOVA table for linear hypothesis in a linear model
### Aliases: ganova
### Keywords: htest model design regression

### ** Examples

data(denim)
attach(denim)
X <- cbind(1,binaries(Denim),binaries(Laundry))
A <- rbind(c(0,1,-1,0,0,0,0),c(0,1,0,-1,0,0,0))
xi <- c(0,0)
ganova(Abrasion,X,A,xi)
detach(denim)



