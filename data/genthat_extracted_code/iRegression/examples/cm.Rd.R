library(iRegression)


### Name: cm
### Title: Centre Method
### Aliases: cm cm.default cm.formula
### Keywords: cm

### ** Examples

data("Cardiological.MinMax", package = "iRegression") ## see Billard and Diday (2000)
ex.cm <- cm(PulseMin~SystMin+DiastMin,PulseMax~SystMax+DiastMax,data=Cardiological.MinMax)
ex.cm




