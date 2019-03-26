library(WilcoxCV)


### Name: wilcox.selection.split
### Title: Wilcoxon-based variable selection in cross-validation (CV) and
###   Monte-Carlo cross-validation (MCCV)
### Aliases: wilcox.selection.split
### Keywords: htest

### ** Examples

# load WilcoxCV library
library(WilcoxCV)

# Generate data
x<-matrix(rnorm(1000),100,10)
y<-sample(c(0,1),100,replace=TRUE)

# Generate 50 MCCV splits with ratio 2:1 for a data set including 90 observations
my.split<-generate.split(niter=50,n=90,ntest=30)

# Compute the Wilcoxon rank sum statistic for the 50 iterations.
wilcox.selection.split(x=x,y=y,split=my.split,algo="new",pvalue=TRUE)



