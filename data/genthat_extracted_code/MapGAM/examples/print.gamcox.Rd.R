library(MapGAM)


### Name: print.gamcox
### Title: Print the 'gamcox' Object
### Aliases: print.gamcox
### Keywords: misc smooth

### ** Examples

## No test: 
data(CAdata)
fit <- gamcox(Surv(time,event)~lo(X,Y)+AGE+INS,data=CAdata, span = 0.2)
print(fit)
## End(No test)



