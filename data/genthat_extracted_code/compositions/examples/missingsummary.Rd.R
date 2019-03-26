library(compositions)


### Name: missingsummary
### Title: Classify and summarize missing values in a dataset
### Aliases: missingSummary missingType
### Keywords: NA

### ** Examples

data(SimulatedAmounts)
x <- acomp(sa.lognormals)
xnew <- simulateMissings(x,dl=0.05,MAR=0.05,MNAR=0.05,SZ=0.05)
xnew
missingSummary(xnew)



