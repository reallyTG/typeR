library(ExpDes)


### Name: graphics
### Title: Regression model plots
### Aliases: graphics

### ** Examples

data(ex1)
attach(ex1)
a<-crd(trat, ig, quali=FALSE, nl=FALSE)
graphics(a, degree=1)
graphics(a, degree=2)
graphics(a, degree=3)



