library(HardyWeinberg)


### Name: HWExact
### Title: Exact test for Hardy-Weinberg equilibrium
### Aliases: HWExact
### Keywords: htest

### ** Examples

#
# Example for an autosomal marker using the standard exact p-value
#
x <- c(298,489,213)
names(x) <- c("MM","MN","NN")
HW.test <- HWExact(x,verbose=TRUE)
#
# Example for an autosomal marker using the mid p-value
#
HW.test <- HWExact(x,verbose=TRUE,pvaluetype="midp")
#
# Example x-linked marker
#
rs5968922  <- c(A=392, B=212, AA=275, AB=296, BB=80 )
HWExact(rs5968922,x.linked=TRUE,verbose=TRUE) 



