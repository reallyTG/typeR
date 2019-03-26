library(GLDEX)


### Name: fun.disc.estimation
### Title: Estimates the mean and variance after cutting up a vector of
###   variable into evenly spaced categories.
### Aliases: fun.disc.estimation
### Keywords: univar

### ** Examples

## Cut up a randomly normally distributed observations into 5 evenly spaced 
## categories and estimate the mean and variance based on this cateogorisation.
junk<-rnorm(1000,3,2)
fun.disc.estimation(junk,5)



