library(iRegression)


### Name: MinMax
### Title: MinMax Method
### Aliases: MinMax MinMax.default MinMax.formula
### Keywords: MinMax

### ** Examples

data("Cardiological.MinMax", package = "iRegression") ## see Billard, L. and Diday, E. (2000)
ex.MinMax <- MinMax(PulseMin~SystMin+DiastMin,PulseMax~SystMax+DiastMax,data=Cardiological.MinMax)
ex.MinMax



