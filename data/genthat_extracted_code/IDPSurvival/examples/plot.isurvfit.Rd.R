library(IDPSurvival)


### Name: plot.isurvfit
### Title: Plot method for 'isurvfit' objects
### Aliases: plot.isurvfit
### Keywords: survival hplot

### ** Examples

leukemia.surv <- isurvfit(Surv(time, status) ~ x, data = aml, display=FALSE) 
plot(leukemia.surv) 
legend(100, .9, c("Maintenance", "No Maintenance"), 
       lty=c(1,1),lwd=c(2,1),col=c('black','red'),pch=c(1,2)) 
title("IDP Curves\nfor AML Maintenance Study") 



