library(qmethod)


### Name: qpcrustes
### Title: Q Methodology: Procrustes rotation of loadings
### Aliases: qpcrustes
### Keywords: multivariate Q methodology Procrustes rotation

### ** Examples

# This example requires installing 'MCMCpack', check warning when running line 10 below:
data(lipset)
qm <- qmethod(lipset[[1]], nfactors=3, rotation="varimax")
qselim <- sample(1:3, 2, replace=FALSE) ##q sorts to eliminate
subdata <- lipset[[1]][ , -qselim]
library(psych)
loa <- as.data.frame(unclass(principal(subdata, 
         nfactors=3, rotate="varimax")$loadings))
target <- as.matrix(as.data.frame(qm[3]))
colnames(target) <- paste("target_f", 1:3, sep="")
subtarget <- target[c(-qselim),]
# qindt <- qpcrustes(loa, subtarget, 3)
# qindt



