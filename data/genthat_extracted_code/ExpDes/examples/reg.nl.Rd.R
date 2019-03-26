library(ExpDes)


### Name: reg.nl
### Title: Non-linear Regression
### Aliases: reg.nl

### ** Examples

data(ex_nl)
attach(ex_nl)
x<-crd(trat, resp, quali=FALSE, nl=TRUE)
graphics(x,degree = "log")



