library(predict3d)


### Name: fit2newdata
### Title: Make a new data set for prediction
### Aliases: fit2newdata

### ** Examples

fit=lm(mpg~hp*wt*cyl+carb+am,data=mtcars)
fit2newdata(fit,predictors=c("hp","wt","am"))
fit2newdata(fit,predictors=c("hp","wt","cyl"))
fit2newdata(fit,predictors=c("hp"))
fit=loess(mpg~hp*wt*am,data=mtcars)
fit2newdata(fit,predictors=c("hp"))
## No test: 
mtcars$engine=ifelse(mtcars$vs==0,"V-shaped","straight")
fit=lm(mpg~wt*engine,data=mtcars)
fit2newdata(fit,predictors=c("wt","engine"))
fit=lm(mpg~wt*factor(vs),data=mtcars)
fit2newdata(fit,predictors=c("wt","vs"))
fit2newdata(lm(mpg~hp*wt,data=mtcars),predictors=c("hp","wt"),mode=3,colorn=30)
fit=lm(mpg~hp*log(wt),data=mtcars)
fit2newdata(fit,predictors=c("hp","log(wt)"))
## End(No test)



