library(HardyWeinberg)


### Name: HWPerm.mult
### Title: Permutation tests fo variants with multiple alleles
### Aliases: HWPerm.mult
### Keywords: misc

### ** Examples

#
# bi-allelic autosomal
#

x1 <- c(AA=298,AB=489,BB=213)
## Not run: 
##D out <- HWPerm.mult(x1)
## End(Not run)

#
# bi-allelic X-chromosomal
#

x2.m <- c(A=39, B=21)
x2.f <- toTriangular(c(AA=28, AB=30, BB=8))
## Not run: 
##D out <- HWPerm.mult(x2.m,x2.f)
## End(Not run)

#
# autosomal k alleles not accounting for gender
#

x3 <- c(AA=12,AB=19,AC=13,BB=7,BC=5,CC=0)
x3 <- toTriangular(x3)
## Not run: 
##D out <- HWPerm.mult(x3)
## End(Not run)

#
# X-chromosomal k alleles 
#

x4.m <- c(A=15,B=17,C=24) 
x4.f <- toTriangular(c(AA=4,AB=2,AC=13,BB=6,BC=19,CC=4))
## Not run: 
##D out <- HWPerm.mult(x4.m,x4.f)
## End(Not run)

#
# Autosomal k alleles accounting for gender
#

x5.m <- toTriangular(c(AA=12,AB=19,AC=13,BB=7,BC=5,CC=0))
x5.f <- toTriangular(c(AA=8,AB=12,AC=13,BB=8,BC=7,CC=0))
## Not run: 
##D out <- HWPerm.mult(x5.m,x5.f)
## End(Not run)




