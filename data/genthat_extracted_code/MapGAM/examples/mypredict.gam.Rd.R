library(MapGAM)


### Name: mypredict.gam
### Title: Prediction for GAM Fits
### Aliases: mypredict.gam
### Keywords: misc smooth

### ** Examples

## No test: 
data(MAdata)							
data(MAmap)
gamgrid <- predgrid(MAdata, map=MAmap)

fit <- gam(Case~lo(Xcoord,Ycoord,span=0.2)+Smoking,data=MAdata,family=binomial())
pred1 = mypredict.gam(fit)
colormap(list(fit=pred1$pred,grid=data.frame(X=MAdata$X,Y=MAdata$Y)),map=MAmap)

pred2 = mypredict.gam(fit,gamgrid)
colormap(list(fit=pred2$pred,grid=data.frame(X=gamgrid$X,Y=gamgrid$Y)),map=MAmap)

pred3 = mypredict.gam(fit,gamgrid,se.fit=TRUE)
colormap(list(fit=pred3$pred,conf.low = pred3$conf.low, conf.high = pred3$conf.high, 
          grid=data.frame(X=gamgrid$X,Y=gamgrid$Y)),map=MAmap,contours = "interval")


## End(No test)



