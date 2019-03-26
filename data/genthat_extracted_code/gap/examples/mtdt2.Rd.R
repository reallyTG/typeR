library(gap)


### Name: mtdt2
### Title: Transmission/disequilibrium test of a multiallelic marker by
###   Bradley-Terry model
### Aliases: mtdt2
### Keywords: models htest

### ** Examples

## Not run: 
##D # Copeman et al (1995) Nat Genet 9: 80-5
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
##D xx <- mtdt2(x,refcat="12")
## End(Not run)



