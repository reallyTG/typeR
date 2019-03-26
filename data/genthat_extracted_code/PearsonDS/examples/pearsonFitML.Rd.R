library(PearsonDS)


### Name: pearsonFitML
### Title: Maximum Likelihood Estimation of Pearson Distributions
### Aliases: pearsonFitML
### Keywords: distribution

### ** Examples

## Generate sample 
DATA <- rpearson(1000,moments=c(mean=1,variance=2,skewness=1,kurtosis=5))
## find Pearson distribution with these parameters
ppar <- pearsonFitML(DATA)
print(unlist(ppar))
## compare with method of moments estimator
print(unlist(pearsonFitM(moments=empMoments(DATA))))



