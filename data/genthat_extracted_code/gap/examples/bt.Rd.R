library(gap)


### Name: bt
### Title: Bradley-Terry model for contingency table
### Aliases: bt
### Keywords: models

### ** Examples

## Not run: 
##D # Copeman JB, Cucca F, Hearne CM, Cornall RJ, Reed PW, 
##D # Ronningen KS, Undlien DE, Nistico L, Buzzetti R, Tosi R, et al.
##D # (1995) Linkage disequilibrium mapping of a type 1 
##D # diabetes susceptibility gene (IDDM7) to chromosome 2q31-q33. 
##D # Nat Genet 9: 80-5
##D 
##D x <- matrix(c(0,0, 0, 2, 0,0, 0, 0, 0, 0, 0, 0,
##D               0,0, 1, 3, 0,0, 0, 2, 3, 0, 0, 0,
##D               2,3,26,35, 7,0, 2,10,11, 3, 4, 1,
##D               2,3,22,26, 6,2, 4, 4,10, 2, 2, 0,
##D               0,1, 7,10, 2,0, 0, 2, 2, 1, 1, 0,
##D               0,0, 1, 4, 0,1, 0, 1, 0, 0, 0, 0,
##D               0,2, 5, 4, 1,1, 0, 0, 0, 2, 0, 0,
##D               0,0, 2, 6, 1,0, 2, 0, 2, 0, 0, 0,
##D               0,3, 6,19, 6,0, 0, 2, 5, 3, 0, 0,
##D               0,0, 3, 1, 1,0, 0, 0, 1, 0, 0, 0,
##D               0,0, 0, 2, 0,0, 0, 0, 0, 0, 0, 0,
##D               0,0, 1, 0, 0,0, 0, 0, 0, 0, 0, 0),nrow=12)
##D 
##D # Bradley-Terry model, only deviance is available in glm
##D # (SAS gives score and Wald statistics as well)
##D bt.ex<-bt(x)
##D anova(bt.ex$bt.glm)
##D summary(bt.ex$bt.glm)
## End(Not run)



