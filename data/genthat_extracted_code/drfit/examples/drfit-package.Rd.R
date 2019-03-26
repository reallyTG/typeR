library(drfit)


### Name: drfit-package
### Title: Dose-response data evaluation
### Aliases: drfit-package
### Keywords: package models regression nonlinear

### ** Examples

data(antifoul)
r <- drfit(antifoul)
format(r,digits=2)
drplot(r,antifoul,overlay=TRUE,bw=FALSE)



