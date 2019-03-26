library(iRegression)


### Name: Cardiological.MinMax
### Title: Cardiological Interval Data Set
### Aliases: Cardiological.MinMax
### Keywords: datasets

### ** Examples

data("Cardiological.MinMax", package = "iRegression")

cm1 <- cm(PulseMin~SystMin+DiastMin,PulseMax~SystMax+DiastMax,data=Cardiological.MinMax)
summary(cm1)

##
data("Cardiological.MinMax", package = "iRegression")

MinMax1 <- MinMax(PulseMin~SystMin+DiastMin,PulseMax~SystMax+DiastMax,data=Cardiological.MinMax)
summary(MinMax1)



