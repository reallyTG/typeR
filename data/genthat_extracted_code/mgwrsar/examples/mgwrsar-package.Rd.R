library(mgwrsar)


### Name: mgwrsar-package
### Title: GWR and MGWR with Spatial Autocorrelation
### Aliases: mgwrsar-package mgwrsar
### Keywords: GWR, mixed GWR, LWR, local regression, SAR, spatial
###   autocorrelation

### ** Examples

library(mgwrsar)
## loading data example
data(data_mgwrsar)
coord=as.matrix(mydata[,c("x_lat","y_lon")])
## Creating a spatial weigth matrix (sparce dgCMatrix) of 8 nearest neighbors
W=KNN(coord,8)

ptm1<-proc.time()
model_GWR<-MGWRSAR(formula = 'Y_gwr~X1+X2+X3', data = mydata,coord=coord,
fixed_vars=NULL,kernels=c('gauss'),H=0.13, Model = 'GWR',
control=list(SE=TRUE,doMC=FALSE))
(proc.time()-ptm1)[3]

summary_mgwrsar(model_GWR)
plot_mgwrsar(model_GWR,type='B_coef',var='X2')
plot_mgwrsar(model_GWR,type='t_coef',var='X2')



