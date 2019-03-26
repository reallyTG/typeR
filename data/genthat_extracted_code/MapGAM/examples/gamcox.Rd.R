library(MapGAM)


### Name: gamcox
### Title: Fit a Cox Additive Model with a Two-Dimensional Smooth
### Aliases: gamcox gamcox.fit
### Keywords: misc smooth

### ** Examples

## No test: 
data(CAdata)
data(CAmap)

fit <- gamcox(Surv(time,event)~AGE + factor(INS) + lo(X,Y),data=CAdata,
span=0.2,loess.trace="approximate")
fit
pred = predict(fit)
colormap(list(fit=pred$pred,grid=data.frame(X=CAdata$X,Y=CAdata$Y)),map=CAmap,
border.gray=0.5)

## End(No test)



