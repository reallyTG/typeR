library(FitAR)


### Name: GetFitAR
### Title: MLE for AR, ARp and ARz
### Aliases: GetFitAR
### Keywords: ts

### ** Examples

#compare results from GetFitAR and FitAR
z<-log(lynx)
z<-z - mean(z)
GetFitAR(z, c(1,2,8))
out<-FitAR(log(lynx), c(1,2,8))
out
coef(out)



