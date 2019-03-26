library(mgwrsar)


### Name: bandwidths_mgwrsar
### Title: Select optimal kernel and bandwidth from a list of models,
###   kernels and bandwidth candidates.
### Aliases: bandwidths_mgwrsar

### ** Examples

## No test: 
library(mgwrsar)
data(data_mgwrsar)
coord=as.matrix(mydata[,c("x_lat","y_lon")])
W=KNN(coord,8)
######################
#### Finding bandwith by hand
#####################

### kernel only space
model_GWR<-MGWRSAR(formula = 'Y_gwr~X1+X2+X3', data = mydata,coord=coord,
fixed_vars=NULL,kernels=c('bisq_knn'),H=50,
Model = 'GWR', control=list(isgcv=FALSE,minv=1))
cat('SSR =')
summary_mgwrsar(model_GWR)

myCV<-function(H){model_GWR<-MGWRSAR(formula = 'Y_gwr~X1+X2+X3', data = mydata,
coord=coord, fixed_vars=NULL,kernels=c('gauss_adapt'),H,
 Model = 'GWR',control=list(isgcv=TRUE))
model_GWR$SSR
}

res=optimize(myCV,upper=500,lower=10)
res

## model with optimal bandwith with adaptative gaussian kernel

model_GWR<-MGWRSAR(formula = 'Y_gwr~X1+X2+X3', data = mydata,coord=coord,
fixed_vars=NULL,kernels=c ('gauss_adapt'),H=ceiling(res$minimum),
Model = 'GWR',control=list(isgcv=FALSE))
summary_mgwrsar(model_GWR)

######################
#### finding the bandwidths using bandwidths_mgwrsar
#####################


mytab<-bandwidths_mgwrsar(formula = 'Y_gwr~X1+X2+X3', data = mydata,coord=coord,
fixed_vars='Intercept',Models=c('GWR','MGWR'),Kernels=c('bisq_knn','gauss_adapt','gauss'),
control=list(),control_search=list (lower_d=8,lower_c=0.03,upper_c=0.65))

names(mytab)
names(mytab[['GWR']])

mytab[['GWR']]$config_model
mytab[['GWR']]$CV
summary(mytab[['GWR']]$model$Betav)


mytab[['GWR_2']]$config_model
mytab[['GWR_2']]$CV
summary(mytab[['GWR_2']]$model$Betav)

mytab[['GWR_3']]$config_model
mytab[['GWR_3']]$CV
summary(mytab[['GWR_3']]$model$Betav)

mytab[['MGWR']]$config_model
mytab[['MGWR']]$CV
mytab[['MGWR']]$model$Betac
summary(mytab[['MGWR']]$model$Betav)

mytab[['MGWR_2']]$config_model
mytab[['MGWR_2']]$CV
mytab[['MGWR_2']]$model$Betac
summary(mytab[['MGWR_2']]$model$Betav)

mytab[['MGWR_3']]$config_model
mytab[['MGWR_3']]$CV
mytab[['MGWR_3']]$model$Betac
summary(mytab[['MGWR_3']]$model$Betav)

mytab2<-bandwidths_mgwrsar(formula = 'Y_gwr~X1+X2+X3', data = mydata,coord=coord,
 fixed_vars='Intercept',Models=c('MGWRSAR_0_kc_kv'),Kernels=c('gauss_adapt'),
 control=list(),control_search=list(search_W=TRUE,kernels_w=c('bisq','gauss_adapt')))

mytab2[['MGWRSAR_0_kc_kv']]$config_model
mytab2[['MGWRSAR_0_kc_kv']]$CV
mytab2[['MGWRSAR_0_kc_kv']]$model$Betac
summary(mytab2[['MGWRSAR_0_kc_kv']]$model$Betav)

## End(No test)



