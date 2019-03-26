library(HardyWeinberg)


### Name: HWLratio
### Title: Likelihood ratio test for Hardy Weinberg equilibrium
### Aliases: HWLratio
### Keywords: htest

### ** Examples

x <- c(298,489,213)
names(x) <- c("MM","MN","NN")
HW.test <- HWLratio(x,verbose=TRUE)
#
# Test for an X-chromsomal SNP.
#
rs5968922 <-  c(A=392, B=212, AA=275, AB=296, BB=80)
HW.test <- HWLratio(rs5968922,x.linked=TRUE,verbose=TRUE)



