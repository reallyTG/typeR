library(MapGAM)


### Name: coef.gamcox
### Title: Coefficents of the 'gamcox' Object
### Aliases: coef.gamcox
### Keywords: misc smooth

### ** Examples

## No test: 
data(CAdata)
fit <- gamcox(Surv(time,event)~lo(X,Y)+AGE+INS,data=CAdata, span = 0.2)
coef(fit)
## End(No test)



