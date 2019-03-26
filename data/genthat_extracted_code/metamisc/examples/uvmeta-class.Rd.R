library(metamisc)


### Name: uvmeta-class
### Title: Class "uvmeta". Result of a univariate meta-analysis.
### Aliases: uvmeta-clas
### Keywords: classes

### ** Examples

data(Collins)

#Extract effect size and error variance
r <- Collins$logOR
vars <- Collins$SE**2

#Frequentist random-effects meta-analysis
fit1 <- uvmeta(r,vars)

#Extract results
fit1$results



