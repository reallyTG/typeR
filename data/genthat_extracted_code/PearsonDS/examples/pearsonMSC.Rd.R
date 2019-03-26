library(PearsonDS)


### Name: pearsonMSC
### Title: Log-Likelihoods and Model Selection Criteria for different
###   Pearson distribution types
### Aliases: pearsonMSC
### Keywords: distribution

### ** Examples

## Generate sample 
DATA <- rpearson(500,moments=c(mean=1,variance=2,skewness=1,kurtosis=5))
## Call pearsonMSC for model selection
MSC  <- pearsonMSC(DATA,control=list(iter.max=1e5,eval.max=1e5))
## log-Likelihood values for all distribution sub-classes
print(MSC$logLik)
## Values for all MSCs and distribution sub-classes
print(MSC$MSCs)
## Model selection for all MSCs
print(MSC$Best)



