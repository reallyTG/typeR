library(SDMTools)


### Name: wt.mean
### Title: Weighted mean, variance and standard deviation calculations
### Aliases: wt.mean wt.sd wt.var

### ** Examples

#define simple data
x = 1:25 # set of numbers
wt = runif(25) #some arbitrary weights

#display means & variances (unweighted and then weighted)
mean(x); wt.mean(x,wt)
var(x); wt.var(x,wt)
sd(x); wt.sd(x,wt)



