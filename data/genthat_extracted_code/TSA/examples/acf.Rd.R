library(TSA)


### Name: acf
### Title: Auto- and Cross- Covariance and -Correlation Function Estimation
### Aliases: acf
### Keywords: methods

### ** Examples

data(rwalk)
model1=lm(rwalk~time(rwalk))
summary(model1)
acf(rstudent(model1),main='')



