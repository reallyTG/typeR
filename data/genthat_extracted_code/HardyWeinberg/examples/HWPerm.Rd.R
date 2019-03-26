library(HardyWeinberg)


### Name: HWPerm
### Title: Permutation test for Hardy-Weinberg equilibrium
### Aliases: HWPerm
### Keywords: htest

### ** Examples

x <- c(MM=298,MN=489,NN=213)
## Not run: 
##D HW.test <- HWPerm(x,nperm=10000,verbose=TRUE) # uses default chi-square statistic
##D HW.test <- HWPerm(x,nperm=10000,verbose=TRUE,function(z)
##D HWChisq(z)$chisq,cc=0.5) # uses chi-square statistic with continuity correction.
##D HW.test <- HWPerm(x,nperm=10000,verbose=TRUE,function(y) HWLratio(y)$G2)
##D # uses likelihood ratio statistic.
##D HWPerm(x,nperm=10000,verbose=TRUE,function(y) 1-HWExact(y)$pval)
##D # uses exact test p-value
##D #
##D # Permutation test for a marker on the X chromosome
##D #
##D rs5968922 <-  c(A=392, B=212, AA=275, AB=296, BB=80)
##D HW.test <- HWPerm(rs5968922,nperm=10000,x.linked=TRUE,verbose=TRUE)
## End(Not run)



