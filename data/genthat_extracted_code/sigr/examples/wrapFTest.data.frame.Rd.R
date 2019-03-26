library(sigr)


### Name: wrapFTest.data.frame
### Title: Wrap quality statistic of identity relation from data.
### Aliases: wrapFTest.data.frame

### ** Examples


d <- data.frame(x=c(1,2,3,4,5,6,7,7),
                y=c(1,1,2,2,3,3,4,4))
model <- lm(y~x,data=d)
summary(model)
d$pred <- predict(model,newdata=d)
sigr::wrapFTest(d,'pred','y')




