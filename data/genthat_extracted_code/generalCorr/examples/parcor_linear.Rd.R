library(generalCorr)


### Name: parcor_linear
### Title: Partial correlation coefficient between Xi and Xj after removing
###   the linear effect of all others.
### Aliases: parcor_linear

### ** Examples


## Not run: 
##D set.seed(34);x=matrix(sample(1:600)[1:99],ncol=3)
##D colnames(x)=c('V1', 'v2', 'V3')
##D c1=cor(x)
##D parcor_linear(c1, 2,3)
## End(Not run)




