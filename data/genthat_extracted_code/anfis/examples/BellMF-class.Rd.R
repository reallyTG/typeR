library(anfis)


### Name: BellMF-class
### Title: Bell Membership Function S4 class
### Aliases: BellMF BellMF-class

### ** Examples

#BellMF example I
#A bell membership function with default prototype (a=1, b=1,c=0)
#The membership of x in the bell, should be 1
#The derivate of the first parameter at x, should be 0
#The derivate of the first parameter at x, should be also 0
bell <- new(Class="BellMF")
bell
evaluateMF(object=bell, x=0)
derivateMF(object=bell, x=0, i=1)
derivateMF(object=bell, x=0, i="a")
#
#BellMF example II
#A bell membership function with parameters (a=4,b=1,c=-10)
#The membership of x in the bell, should be 0.137931
#The derivate of the first parameter at x, should be 0.05945303
#The derivate on "a" at x=0, should be 0.05945303
bell2 <- new(Class="BellMF",parameters=c(a=4,b=1,c=-10))
bell2
evaluateMF(object=bell2, x=0)
derivateMF(object=bell2, x=0, i=1)
derivateMF(object=bell2, x=0, i="a")



