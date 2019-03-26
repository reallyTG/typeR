library(PearsonDS)


### Name: empMoments
### Title: Empirical Moments
### Aliases: empMoments
### Keywords: distribution

### ** Examples

## Generate sample with given (theoretical) moments
DATA <- rpearson(25000,moments=c(mean=1,variance=2,skewness=1,kurtosis=5))
## Calculate corresponding empirical moments
empMoments(DATA)



