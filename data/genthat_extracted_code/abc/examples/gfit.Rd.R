library(abc)


### Name: gfit
### Title: Goodness of fit
### Aliases: gfit

### ** Examples

## human demographic history
require(abc.data)
data(human)

##  Perform a test of goodness-of-fit.
##  The data are the European data and we test the fit of the bottleneck 
## model (good fit) and of the constant-size population model (poor fit) 
## Use larger values of \code{nb.replicate} (e.g. 1000)
## for real applications
res.gfit.bott=gfit(target=stat.voight["italian",], 
sumstat=stat.3pops.sim[models=="bott",], statistic=mean, nb.replicate=10)
res.gfit.const=gfit(target=stat.voight["italian",], 
sumstat=stat.3pops.sim[models=="const",], statistic=mean, nb.replicate=10)


## Plot the distribution of the null statistic and indicate where is the 
## observed value.
plot(res.gfit.bott, main="Histogram under H0")
## Call the function \code{summary}
## It computes the P-value, call \code{summary} on the vector 
## \code{dist.sim} and returns the value of the observed statistic
summary(res.gfit.bott)



