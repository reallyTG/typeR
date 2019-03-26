library(equivalenceTest)


### Name: equivTestFixedMarginCombPlot
### Title: Provide a combined plot for equivvalence test
### Aliases: equivTestFixedMarginCombPlot

### ** Examples

vecR = rnorm(20,0,1)
vecT = rnorm(20,-1.5,1)
et = equivTestFixedMargin(vecT,vecR)
equivTestFixedMarginCombPlot(et)



