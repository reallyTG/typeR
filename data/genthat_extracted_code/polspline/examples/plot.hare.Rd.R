library(polspline)


### Name: plot.hare
### Title: Hare: hazard regression
### Aliases: plot.hare
### Keywords: distribution smooth survival

### ** Examples

fit <- hare(testhare[,1], testhare[,2], testhare[,3:8])       
# hazard curve for covariates like case 1 
plot(fit, testhare[1,3:8], what = "h") 
# survival function as a function of covariate 2, for covariates as case 1 at t=3 
plot(fit, testhare[1,3:8], which = 2, what = "s",  time = 3)  



