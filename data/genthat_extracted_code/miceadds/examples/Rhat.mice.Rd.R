library(miceadds)


### Name: Rhat.mice
### Title: Rhat Convergence Statistic of a 'mice' Imputation
### Aliases: Rhat.mice
### Keywords: Rhat statistic Convergence

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Rhat statistic for nhanes data
##D #############################################################################
##D 
##D library(mice)
##D data(nhanes, package="mice")
##D set.seed(9090)
##D 
##D # nhanes 3 parallel chains
##D imp1 <- mice::mice( nhanes, m=3, maxit=10, method=rep("norm", 4 ))
##D miceadds::Rhat.mice( imp1 )
##D   ##     variable MissProp Rhat.M.imp Rhat.Var.imp
##D   ##   1      bmi       36  1.0181998     1.155807
##D   ##   2      hyp       32  1.0717677     1.061174
##D   ##   3      chl       40  0.9717109     1.318721
## End(Not run)



