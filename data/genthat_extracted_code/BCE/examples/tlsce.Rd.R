library(BCE)


### Name: tlsce
### Title: Total Least Squares Composition Estimator
### Aliases: tlsce
### Keywords: models

### ** Examples

A <- t(bceInput$Rat)
B <- t(bceInput$Dat)
tlsce(A,B)
## weighting Wa inversely proportional to A
tlsce(A,B,Wa=1/A)



