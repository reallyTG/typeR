library(gap)


### Name: pfc
### Title: Probability of familial clustering of disease
### Aliases: pfc
### Keywords: models

### ** Examples

## Not run: 
##D # IPF among 203 siblings of 100 COPD patients from Liang KY, SL Zeger,
##D # Qaquish B. Multivariate regression analyses for categorical data
##D # (with discussion). J Roy Stat Soc B 1992, 54:3-40
##D 
##D # the degrees of freedom is 15
##D famtest<-c(
##D 1, 0, 36,
##D 1, 1, 12,
##D 2, 0, 15,
##D 2, 1,  7,
##D 2, 2,  1,
##D 3, 0,  5,
##D 3, 1,  7,
##D 3, 2,  3,
##D 3, 3,  2,
##D 4, 0,  3,
##D 4, 1,  3,
##D 4, 2,  1,
##D 6, 0,  1,
##D 6, 2,  1,
##D 6, 3,  1,
##D 6, 4,  1,
##D 6, 6,  1)
##D test<-t(matrix(famtest,nrow=3))
##D famp<-pfc(test)
## End(Not run)



