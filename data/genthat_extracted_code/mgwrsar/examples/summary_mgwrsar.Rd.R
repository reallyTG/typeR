library(mgwrsar)


### Name: summary_mgwrsar
### Title: Print a summary of mgwrsar models
### Aliases: summary_mgwrsar

### ** Examples

## Not run: 
##D library(mgwrsar)
##D data(data_mgwrsar)
##D coord=as.matrix(mydata[,c("x_lat","y_lon")])
##D W=KNN(coord,8)
##D model_GWR<-MGWRSAR(formula = 'Y_gwr~X1+X2+X3', data = mydata,coord=coord,
##D  fixed_vars=NULL,kernels=c('gauss'),H=0.13, Model = 'GWR',
##D  control=list(SE=TRUE))
##D summary_mgwrsar(model_GWR)
## End(Not run)



