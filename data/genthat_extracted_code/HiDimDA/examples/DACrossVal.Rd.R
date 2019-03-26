library(HiDimDA)


### Name: DACrossVal
### Title: Cross Validation for Discriminant Analysis Classification
###   Algorithms
### Aliases: DACrossVal

### ** Examples


# Evaluate the performance of traditional (Fisher's) linear discriminant
# analysis on the iris data set, by ten-fold cross-validation replicated 
# three times.

library(MASS)
CrosValRes1 <- DACrossVal(iris[1:4],iris$Species,TrainAlg=lda,CVrep=3)
summary(CrosValRes1[,,"Clerr"])

# Evaluate the performance on Alon's Colon Cancer Data set 
# (with a logarithmic transformation), of a one-factor 
# linear discriminant rule with the best fifty genes, 
# by four-fold cross-validation.

## Not run: 
##D 
##D CrosValRes2 <- DACrossVal(log10(AlonDS[,-1]),AlonDS$grouping,TrainAlg=RFlda,
##D ldafun="classification",Selmethod="fixedp",maxp=50,kfold=4,CVrep=1)
##D summary(CrosValRes2[,,"Clerr"])
##D 
## End(Not run)




