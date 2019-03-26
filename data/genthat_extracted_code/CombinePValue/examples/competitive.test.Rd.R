library(CombinePValue)


### Name: competitive.test
### Title: competitive.test: combine a vector of correlated p-values
### Aliases: competitive.test competitive.test
### Keywords: package

### ** Examples

#Compare Pvalue vs randomly selected p values in columns of p_random.

b<-matrix(c(0.12,0.06,0.07,0.71,0.02,0.09,0.41,0.01,0.10,0.32,0.14,0.37,0.001,0.009,0.013),nrow=3) 
competitive.test(Pvalue=c(0.01,0.04,0.06),Weight=c(2,5,1),p_random=b) 




