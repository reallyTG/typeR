library(conting)


### Name: bayespval
### Title: Compute Bayesian p-value
### Aliases: bayespval

### ** Examples

set.seed(1)
## Set seed for reproducibility
data(spina)
## Load spina data

test1<-bict(formula=y~(S1+S2+S3+eth)^2,data=spina,n.sample=50,prior="UIP")
## Do 50 iterations starting at maximal model containing all two-way interactions.

test1p<-bayespval(object=test1,statistic="FreemanTukey",n.burnin=5)
## Use the Freeman-Tukey statistic and a burn-in phase of 5 iterations.
test1p
## Will get following output

#Under the Freeman-Tukey statistic 
#
#Summary statistics for T_pred 
#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#  2.812   4.695   5.190   5.777   6.405  14.490 
#
#Summary statistics for T_obs 
#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#  4.566   4.861   5.197   5.430   6.108   6.460 
#
#Bayesian p-value =  0.4667

## Can do a plot

## Not run: plot(test1p)





