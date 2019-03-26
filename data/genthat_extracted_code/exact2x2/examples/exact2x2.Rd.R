library(exact2x2)


### Name: exact2x2
### Title: Exact Conditional Tests for 2 by 2 Tables of Count Data
### Aliases: exact2x2 fisher.exact blaker.exact mcnemar.exact
### Keywords: htest

### ** Examples

## In example 1, notice how fisher.test rejects the null at the 5 percent level, 
## but the 95 percent confidence interval on the odds ratio contains 1 
## The intervals do not match the p-value.
## In fisher.exact you get p-values and the matching confidence intervals 
example1<-matrix(c(6,12,12,5),2,2,dimnames=list(c("Group A","Group B"),c("Event","No Event")))
example1
fisher.test(example1)
fisher.exact(example1,tsmethod="minlike")
fisher.exact(example1,tsmethod="central")
blaker.exact(example1)
## In example 2, this same thing happens, for
## tsmethod="minlike"... this cannot be avoided because 
## of the holes in the confidence set.
##  
example2<-matrix(c(7,255,30,464),2,2,dimnames=list(c("Group A","Group B"),c("Event","No Event")))
example2
fisher.test(example2)
exact2x2(example2,tsmethod="minlike")
## you can never get a test-CI inconsistency when tsmethod="central"
exact2x2(example2,tsmethod="central")



