library(HardyWeinberg)


### Name: HWChisq
### Title: Chi square tests for Hardy Weinberg equilibrium
### Aliases: HWChisq
### Keywords: htest

### ** Examples

#
# Test for an autosomal blood group marker
#
x <- c(MM=298,MN=489,NN=213)
HW.test <- HWChisq(x,verbose=TRUE)
#
# Same test without continuity correction
#
HW.test <- HWChisq(x,cc=0,verbose=TRUE)
#
# Test for an X-chromsomal SNP.
#
rs5968922 <-  c(A=392, B=212, AA=275, AB=296, BB=80)
HW.test <- HWChisq(rs5968922,cc=0,x.linked=TRUE,verbose=TRUE)



