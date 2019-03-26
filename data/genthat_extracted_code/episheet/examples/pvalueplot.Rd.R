library(episheet)


### Name: pvalueplot
### Title: Plot the p-value function
### Aliases: pvalueplot
### Keywords: R Rothman episheet pvalues

### ** Examples

pvalueplot(
  est1.ll = 0.9,
  est1.ul = 12,
  xlabel = "Relative Risk"
)

pvalueplot(
  est1.ll = 0.8,
  est1.ul = 3.8,
  est2.ll = 1.2,
  est2.ul = 2,
  label1 = "Estimate 1",
  label2 = "Estimate 2",
  xlabel = "Relative Risk",
  citype = "95%CI"
)



