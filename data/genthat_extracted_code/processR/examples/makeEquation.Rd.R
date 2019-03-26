library(processR)


### Name: makeEquation
### Title: Make mediation equations 3
### Aliases: makeEquation

### ** Examples

X="X";M=c("M1","M2","M3");Y=c("Y1","Y2");add2ndMediation=TRUE
covar=list(name=c("C1","C2","C3"),label=c("ese","sex","tenure"),site=list(c("M1","Y1"),"Y2","Y2"))
cat(makeEquation(X,M,Y,covar=covar))



