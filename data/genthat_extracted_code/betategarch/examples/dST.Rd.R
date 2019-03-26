library(betategarch)


### Name: dST
### Title: The skewed t distribution
### Aliases: dST rST STmean STvar STskewness STkurtosis
### Keywords: Statistical Models

### ** Examples

##generate 1000 random numbers from the skewed t:
set.seed(123)
eps <- rST(500, df=5) #symmetric t
eps <- rST(500, df=5, skew=0.8) #skewed to the left
eps <- rST(500, df=5, skew=2) #skewed to the right

##compare empirical mean with analytical:
mean(eps)
STmean(5, skew=2)

##compare empirical variance with analytical:
var(eps)
STvar(5, skew=2)



