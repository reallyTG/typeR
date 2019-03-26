library(repolr)


### Name: predict.repolr
### Title: Predict Method for Fitted repolr Model
### Aliases: predict.repolr

### ** Examples

data(HHSpain)
mod.0 <- repolr(HHSpain~Sex*Time, data=HHSpain, categories=4, subjects="Patient",
            times=c(1,2,5), corr.mod="uniform", alpha=0.5)
predict(mod.0, newdata = data.frame(Patient = rep(100, 3), Time = c(1, 2, 5),
       Sex = factor(rep(1, 3), levels=1:2, labels=c("F", "M"))), 
       type="link", se.fit = TRUE)



