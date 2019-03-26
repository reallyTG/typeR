library(mgwrsar)


### Name: MGWRSAR
### Title: Estimation of linear and local linear model with spatial
###   autocorrelation model (mgwrsar).
### Aliases: MGWRSAR

### ** Examples

## No test: 
data(data_mgwrsar)
coord=as.matrix(mydata[,c("x_lat","y_lon")])
model_GWR<-MGWRSAR(formula = 'Y_gwr~X1+X2+X3', data = mydata,coord=coord,
fixed_vars=NULL,kernels=c('gauss_knn'),
H=120, Model = 'GWR',control=list())
summary_mgwrsar(model_GWR)

W=KNN(coord,8)
model_MGWRSAR_0_kc_kv<-MGWRSAR(formula = 'Y_mgwrsar_0_kc_kv~X1+X2+X3', data = mydata,
coord=coord,fixed_vars='Intercept',kernels=c('gauss_adapt'),
H=120, Model = 'MGWRSAR_0_kc_kv',control=list(W=W))
summary_mgwrsar(model_MGWRSAR_0_kc_kv)
## End(No test)



