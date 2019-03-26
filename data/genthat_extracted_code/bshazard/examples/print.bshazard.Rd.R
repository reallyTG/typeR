library(bshazard)


### Name: print.bshazard
### Title: Print a short summary of the hazard rate
### Aliases: print.bshazard
### Keywords: survival nonparametric

### ** Examples

data(lung,package="survival")
 fit<-bshazard(Surv(time, status==2) ~ 1,data=lung)
print(fit)    



