library(qrmix)


### Name: predict.qrmix
### Title: Predict Method for qrmix Fits
### Aliases: predict.qrmix

### ** Examples


data(blood.pressure)

set.seed(8)
sampleInd = sort(sample(1:500, 400))
bpSample1 = blood.pressure[sampleInd,]
bpSample2 = blood.pressure[-sampleInd,]

mod1 = qrmix(bmi ~ ., data = bpSample1, k = 3)

#Cluster assigned to the training values
predict(mod1)

#Residuals corresponding to the response predicted values from mod1 for new data
predict(mod1, newdata = bpSample2, type = "residuals")




