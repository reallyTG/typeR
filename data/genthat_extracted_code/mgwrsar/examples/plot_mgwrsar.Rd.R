library(mgwrsar)


### Name: plot_mgwrsar
### Title: plot_mgwrsar plots the value of local paramaters of a mgwrsar
###   models using a leaflet map.
### Aliases: plot_mgwrsar

### ** Examples

## No test: 
library(mgwrsar)
data(data_mgwrsar)
coord=as.matrix(mydata[,c("x_lat","y_lon")])
W=KNN(coord,4)
model_GWR<-MGWRSAR(formula = 'Y_gwr~X1+X2+X3', data = mydata, coord=coord,
fixed_vars=NULL,kernels=c('gauss'),H=0.13,
Model = 'GWR', control=list(SE=TRUE))
summary_mgwrsar(model_GWR)
plot_mgwrsar(model_GWR,type='t_coef',var='X1')
## End(No test)



