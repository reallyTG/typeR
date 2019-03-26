library(rgr)


### Name: gx.add.chisq
### Title: Function to Add Fences to Chi-square Plots
### Aliases: gx.add.chisq
### Keywords: aplot

### ** Examples

##  Synthesize test data
test <- mvrnorm(100, mu = c(40 ,30),Sigma = matrix(c(6, 3, 3, 2), 2, 2))

## Display annotated Chi-square plot
gx.md.gait(test)
gx.md.gait(test, ifadd = c(0.9, 0.98))

## Clean-up
rm(test)



