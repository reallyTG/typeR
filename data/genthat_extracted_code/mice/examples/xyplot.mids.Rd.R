library(mice)


### Name: xyplot.mids
### Title: Scatterplot of observed and imputed data
### Aliases: xyplot.mids xyplot
### Keywords: hplot

### ** Examples

imp <- mice(boys, maxit=1)

### xyplot: scatterplot by imputation number
### observe the erroneous outlying imputed values
### (caused by imputing hgt from bmi)
xyplot(imp, hgt~age|.imp, pch=c(1,20),cex=c(1,1.5))

### same, but label with missingness of wgt (four cases)
xyplot(imp, hgt~age|.imp, na.group=wgt, pch=c(1,20),cex=c(1,1.5))




