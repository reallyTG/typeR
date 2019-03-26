library(equivalenceTest)


### Name: scatterPlotEquivTestData
### Title: Provide a side-by-side scatter plot of two or three datasets for
###   equivalence test.
### Aliases: scatterPlotEquivTestData

### ** Examples

vecT = rnorm(20,-1.5,1)
vecR = rnorm(20,0,1)
vecR1 = rnorm(20,0,1)
scatterPlotEquivTestData(vecT,vecR,labelT="T",labelR="R",qa="potency")
scatterPlotEquivTestData(vecT,vecR,vecR1,labelT="T",labelR="R",labelR1="R1",qa="potency")



