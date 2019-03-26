library(mgwrsar)


### Name: mgwrsar_bootstrap_test
### Title: A bootstrap test for Betas for mgwrsar class model.
### Aliases: mgwrsar_bootstrap_test

### ** Examples

## No test: 
 data(data_mgwrsar)
 coord=as.matrix(mydata[,c("x_lat","y_lon")])
 model_GWR<-MGWRSAR(formula = 'Y_gwr~X1+X2+X3', data = mydata, coord=coord,
  fixed_vars=NULL,kernels=c('gauss_adapt'), H=20,
  Model = 'GWR',control=list(SE=TRUE))

 model_MGWR<-MGWRSAR(formula = 'Y_gwr~X1+X2+X3', data = mydata, coord=coord,
 fixed_vars='Intercept',kernels=c('gauss_adapt'), H=20,
 Model = 'MGWR',control=list(SE=TRUE))

 mgwrsar_bootstrap_test(model_MGWR,model_GWR,domc=FALSE,B=30)
## End(No test)



