library(GPoM)


### Name: allToTest
### Title: A list providing the description of six models tested by the
###   function 'autoGPoMoTest'.
### Aliases: allToTest
### Keywords: data

### ** Examples

###########
# example #
###########
data("allToTest")
# 6 models are available in this list:
names(allToTest)
# The parameter of their formulation (nVar and dMax)
# can be retrieved:
nVar <- dim(allToTest$mToTest6)[2]
dMax <- p2dMax(nVar = 3, pMaxKnown = dim(allToTest$mToTest6)[1])
# Their equation can be edited as follows:
visuEq(nVar, dMax, allToTest$mToTest6, approx = 2)




