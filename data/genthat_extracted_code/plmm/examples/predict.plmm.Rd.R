library(plmm)


### Name: predict
### Title: Conditional or Unconditional Model Prediction
### Aliases: predict.plmm predict.wplmm

### ** Examples

data(plmm.data)
model <- plmm(y0~x1+x2+x3|t1, random=cluster, data=plmm.data)
pred_data <- data.frame(x1=c("F","M"), x2=c(15,25), x3=c(3,2), t1=c(5, 4), cluster=c(1,5))
predict(model, newdata=pred_data, data=plmm.data)
predict(model, newdata=pred_data, data=plmm.data, cond=FALSE)



