library(miscTools)


### Name: sumKeepAttr
### Title: Sum of an Array While Keeping its Attributes
### Aliases: sumKeepAttr
### Keywords: methods

### ** Examples

a <- 1:10
attr( a, "min" ) <- 1
attr( a, "max" ) <- 10
sum(a)
sumKeepAttr(a)



