library(MapGAM)


### Name: predict.gamcox
### Title: Prediction Method for 'gamcox' Fits
### Aliases: predict.gamcox
### Keywords: misc smooth

### ** Examples

## No test: 
data(CAdata)
data(CAmap)
fit <- gamcox(Surv(time,event)~AGE + factor(INS) + lo(X,Y),data=CAdata,
       span=0.2,loess.trace="approximate")
fit
pred1 = predict(fit)
colormap(list(fit=pred1$pred,grid=data.frame(X=CAdata$X,Y=CAdata$Y)),map=CAmap,
         border.gray=0.5)

data(CAgrid)
pred2 = predict(fit,CAgrid[,c("X","Y")])
colormap(list(fit=pred2$pred,grid=data.frame(X=CAgrid$X,Y=CAgrid$Y)),map=CAmap,
        border.gray=0.5, legend.name="log hazard ratio")

## Circle significant areas based on the confidence intervals specified by conf.low and conf.high
pred3 = predict(fit,CAgrid[,c("X","Y")],se.fit=TRUE)
colormap(list(fit=pred3$pred,conf.low = pred3$conf.low, conf.high = pred3$conf.high,
          grid=data.frame(X=CAgrid$X,Y=CAgrid$Y)),map=CAmap,border.gray = 0.7,
          contours = "interval",legend.name="log hazard ratio")
## End(No test)



