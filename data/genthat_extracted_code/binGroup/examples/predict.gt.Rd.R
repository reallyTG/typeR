library(binGroup)


### Name: predict.gt
### Title: Predict Method for Group Testing Model Fits
### Aliases: predict.gt
### Keywords: regression models

### ** Examples


data(hivsurv)

fit1 <- gtreg(formula = groupres ~ AGE + EDUC., data = hivsurv,  
  groupn = gnum, sens = 0.9, spec = 0.9, linkf = "logit", method = "V")
pred.data <- data.frame(AGE = c(15, 25, 30), EDUC. = c(1, 3, 2))
predict(object = fit1, newdata = pred.data, type = "link", se.fit = TRUE)
predict(object = fit1, newdata = pred.data, type = "response", 
  se.fit = TRUE, conf.level = 0.9)
predict(object = fit1, type = "response", se.fit = TRUE, conf.level = 0.9)





