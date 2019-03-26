library(equivalenceTest)


### Name: equivTestPlot
### Title: Plot the equivalence test result
### Aliases: equivTestPlot

### ** Examples

equivTestPlot(0.623,c(-2,2),0.05,c(-9.79,9.79),
  "q a","test","reference")
equivTestPlot(0.623,c(-2,2),0.05,c(-9.79,9.79),
  "Relative Potency","test","reference",showDrugName = TRUE,showQA=TRUE,showCINumbers = TRUE)
equivTestPlot(0.5,c(-1.05,2.05),0.05,c(-9.79,9.79),
  "Relative Potency","test","reference",showQA=TRUE,showCINumbers = TRUE)



