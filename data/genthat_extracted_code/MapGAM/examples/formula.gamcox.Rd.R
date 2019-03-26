library(MapGAM)


### Name: formula.gamcox
### Title: Formula of the 'gamcox' Object
### Aliases: formula.gamcox
### Keywords: misc smooth

### ** Examples

## No test: 
data(CAdata)
fit <- gamcox(Surv(time,event)~lo(X,Y)+AGE+INS,data=CAdata, span = 0.2)
formula(fit)
## End(No test)



