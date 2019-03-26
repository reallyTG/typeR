library(MapGAM)


### Name: summary.gamcox
### Title: Summarize the 'gamcox' Object
### Aliases: summary.gamcox
### Keywords: misc smooth

### ** Examples

## No test: 
data(CAdata)
fit <- gamcox(Surv(time,event)~lo(X,Y)+AGE+INS,data=CAdata, span = 0.2)
summary(fit)
## End(No test)



