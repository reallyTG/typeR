library(iRegression)


### Name: summary.MinMax
### Title: Summarizing MinMax Method Fits
### Aliases: summary.MinMax
### Keywords: summary MinMax

### ** Examples

##-- Continuing the  MinMax() example:
data("Cardiological.MinMax", package = "iRegression")
ex.MinMax <- MinMax(PulseMin~SystMin+DiastMin,PulseMax~SystMax+DiastMax,data=Cardiological.MinMax)
ex.sum <- summary(ex.MinMax)
ex.sum



