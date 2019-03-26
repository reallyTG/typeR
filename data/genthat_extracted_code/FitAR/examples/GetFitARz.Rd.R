library(FitAR)


### Name: GetFitARz
### Title: Exact MLE for AR(p) and Subset ARz - Short Version
### Aliases: GetFitARz
### Keywords: ts

### ** Examples

#compare results from GetFitARz and FitAR
z<-log(lynx)
z<-z - mean(z)
GetFitARz(z, c(1,2,8))
out<-FitAR(log(lynx), c(1,2,8), ARModel="ARz")
out
coef(out)



