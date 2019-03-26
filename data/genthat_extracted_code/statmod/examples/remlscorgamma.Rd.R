library(statmod)


### Name: remlscoregamma
### Title: Approximate REML for gamma regression with structured dispersion
### Aliases: remlscoregamma
### Keywords: regression

### ** Examples

data(welding)
attach(welding)
y <- Strength
X <- cbind(1,(Drying+1)/2,(Material+1)/2)
colnames(X) <- c("1","B","C")
Z <- cbind(1,(Material+1)/2,(Method+1)/2,(Preheating+1)/2)
colnames(Z) <- c("1","C","H","I")
out <- remlscoregamma(y,X,Z)



