library(hda)


### Name: hda
### Title: Heteroscedastic discriminant analysis
### Aliases: hda hda.default hda.formula print.hda
### Keywords: classif multivariate

### ** Examples

library(mvtnorm)
library(MASS)

# simulate data for two classes
n           <- 50
meana       <- meanb <- c(0,0,0,0,0)
cova        <- diag(5)
cova[1,1]   <- 0.2
for(i in 3:4){
  for(j in (i+1):5){
    cova[i,j] <- cova[j,i] <- 0.75^(j-i)}
  }
covb       <- cova
diag(covb)[1:2]  <- c(1,0.2)

xa      <- rmvnorm(n, meana, cova)
xb      <- rmvnorm(n, meanb, covb)
x       <- rbind(xa, xb)
classes <- as.factor(c(rep(1,n), rep(2,n)))
# rotate simulated data
symmat <- matrix(runif(5^2),5)
symmat <- symmat + t(symmat)
even   <- eigen(symmat)$vectors
rotatedspace <- x %*% even
plot(as.data.frame(rotatedspace), col = classes)

# apply linear discriminant analysis and plot data on (single) discriminant axis
lda.res <- lda(rotatedspace, classes)
plot(rotatedspace %*% lda.res$scaling, col = classes, 
     ylab = "discriminant axis", xlab = "Observation index")

# apply heteroscedastic discriminant analysis and plot data in discriminant space
hda.res <- hda(rotatedspace, classes)
plot(hda.res$hda.scores, col = classes)

# compare with principal component analysis
pca.res  <- prcomp(as.data.frame(rotatedspace), retx = TRUE)
plot(as.data.frame(pca.res$x), col=classes)

# Automatically build classification rule
# this requires package e1071
hda.res2 <- hda(rotatedspace, classes, crule = TRUE)



