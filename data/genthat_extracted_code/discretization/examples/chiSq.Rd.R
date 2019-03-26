library(discretization)


### Name: chiSq
### Title: Auxiliary function for discretization using Chi-square statistic
### Aliases: chiSq

### ** Examples

#----Calulate Chi-Square
b=c(2,4,1,2,5,3)
m=matrix(b,ncol=3)
chiSq(m)
chisq.test(m)$statistic



