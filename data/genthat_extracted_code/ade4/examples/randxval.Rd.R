library(ade4)


### Name: randxval
### Title: Two-fold cross-validation
### Aliases: randxval krandxval as.krandxval print.krandxval as.randxval
###   print.randxval
### Keywords: htest

### ** Examples

## an example corresponding to 10 statistics and 100 repetitions
cv <- as.krandxval(RMSEc = matrix(rnorm(1000), nrow = 100), RMSEv =
matrix(rnorm(1000, mean = 1), nrow = 100))
cv
if(adegraphicsLoaded())
plot(cv) 




