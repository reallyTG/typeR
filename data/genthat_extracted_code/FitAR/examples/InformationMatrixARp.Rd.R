library(FitAR)


### Name: InformationMatrixARp
### Title: Fisher Information Matrix Subset Case, ARp
### Aliases: InformationMatrixARp
### Keywords: ts

### ** Examples

#variances of parameters in a subset ARp(1,2,6)
fi<-InformationMatrixARp(c(0.36,0.23,0.23),c(1,2,6))
sqrt(diag(solve(fi*197)))



