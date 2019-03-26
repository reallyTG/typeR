library(HardyWeinberg)


### Name: HWExactPrevious
### Title: Exact test for Hardy-Weinberg equilibrium
### Aliases: HWExactPrevious
### Keywords: htest

### ** Examples

#
# Example autosomal marker
#
x <- c(298,489,213)
names(x) <- c("MM","MN","NN")
## Not run: HW.test <- HWExactPrevious(x,verbose=TRUE)
#
# Example x-linked marker
#
rs5968922  <- c(A=392, B=212, AA=275, AB=296, BB=80 )
## Not run: HWExactPrevious(rs5968922,x.linked=TRUE,verbose=TRUE) 



