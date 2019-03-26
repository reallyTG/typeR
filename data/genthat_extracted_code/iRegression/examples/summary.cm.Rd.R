library(iRegression)


### Name: summary.cm
### Title: Summarizing Centre Method Fits
### Aliases: summary.cm
### Keywords: summary cm

### ** Examples

##-- Continuing the  cm() example:
data("Cardiological.MinMax", package = "iRegression")
ex.cm <- cm(PulseMin~SystMin+DiastMin,PulseMax~SystMax+DiastMax,data=Cardiological.MinMax)
ex.sum <- summary(ex.cm)
ex.sum



