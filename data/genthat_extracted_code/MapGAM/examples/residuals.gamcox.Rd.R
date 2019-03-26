library(MapGAM)


### Name: residuals.gamcox
### Title: Residuals of the 'gamcox' Object
### Aliases: residuals.gamcox
### Keywords: misc smooth

### ** Examples

## No test: 
data(CAdata)
fit <- gamcox(Surv(time,event)~lo(X,Y)+AGE+INS,data=CAdata, span = 0.2)
residuals(fit)
## End(No test)



