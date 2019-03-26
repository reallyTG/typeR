library(jmuOutlier)


### Name: perm.cor.test
### Title: Permutation Test on Correlation
### Aliases: perm.cor.test
### Keywords: Correlation Permutation test

### ** Examples

x = c( 4, 6, 8, 11 ) ;   y = c( 19, 44, 15, 13 )
perm.cor.test( x, y, "less", "pearson" ) 
perm.cor.test( x, y, "less", "spearman" )



