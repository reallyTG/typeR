library(mgwrsar)


### Name: predict_mgwrsar
### Title: mgwrsar Model Predictions
### Aliases: predict_mgwrsar

### ** Examples

## No test: 
library(mgwrsar)
data(data_mgwrsar)
coord=as.matrix(mydata[,c("x_lat","y_lon")])
W=KNN(coord,2)
model_GWR_insample<-MGWRSAR(formula = 'Y_gwr~X1+X2+X3', data = mydata[1:800,],
coord=coord[1:800,],fixed_vars=NULL,kernels=c('gauss_adapt'),H=50,
 Model = 'GWR',control=list())
Y_pred=predict_mgwrsar(model_GWR_insample, newdata=mydata[801:1000,],
newdata_coord=coord[801:1000,],k_extra = 8, kernel_extra = "sheppard")
head(Y_pred)
head(mydata$Y_gwr[801:1000])
sqrt(mean((mydata$Y_gwr[801:1000]-Y_pred)^2))

## predict with spatial autocorrelation
model_MGWRSAR_1_0_kv_insample<-MGWRSAR(formula = 'Y_mgwrsar_1_0_kv~X1+X2+X3',data = mydata[1:800,],
coord=coord[1:800 ,], fixed_vars=NULL,kernels=c('gauss_adapt'),H=50,
Model = 'MGWRSAR_1_0_kv',control=list(W=W[1:800,1:800],Lambdacor=TRUE,SE=TRUE))
summary_mgwrsar(model_MGWRSAR_1_0_kv_insample)

## with BLUP
Y_pred=predict_mgwrsar(model_MGWRSAR_1_0_kv_insample, newdata=mydata[801:1000,],
newdata_coord=coord[801:1000,], k_extra = 12,  W = W,
 type = "BPN",kernel_extra = "sheppard")
head(Y_pred)
head(mydata$Y_gwr[801:1000])
sqrt(mean((mydata$Y_gwr[801:1000]-Y_pred)^2))

## without BLUP
Y_pred=predict_mgwrsar(model_MGWRSAR_1_0_kv_insample, newdata=mydata[801:1000,],
newdata_coord=coord[801:1000,], k_extra = 12,  W = W,
type = "TC",kernel_extra = "sheppard")
head(Y_pred)
head(mydata$Y_mgwrsar_1_0_kv[801:1000])
sqrt(mean((mydata$Y_mgwrsar_1_0_kv[801:1000]-Y_pred)^2))
## End(No test)



