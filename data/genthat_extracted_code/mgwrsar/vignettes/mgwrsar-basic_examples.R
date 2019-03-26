## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----load_data-----------------------------------------------------------
library(mgwrsar)
## loading data example
data(data_mgwrsar)
coord=as.matrix(mydata[,c("x_lat","y_lon")])
## Creating a spatial weigth matrix (sparce dgCMatrix) of 8 nearest neighbors
W=KNN(coord,8)

## ----GWR1----------------------------------------------------------------
### with parallel computing
#ptm1<-proc.time()
#model_GWR<-MGWRSAR(formula = 'Y_gwr~X1+X2+X3', data = mydata,coord=coord, #fixed_vars=NULL,kernels=c('gauss'),H=0.13, Model = 'GWR',control=list(SE=TRUE,doMC=TRUE,ncore=4))
#(proc.time()-ptm1)[3]

### without parallel computing
ptm1<-proc.time()
model_GWR<-MGWRSAR(formula = 'Y_gwr~X1+X2+X3', data = mydata,coord=coord, fixed_vars=NULL,kernels=c('gauss'),H=0.13, Model = 'GWR',control=list(SE=TRUE,doMC=FALSE))
(proc.time()-ptm1)[3]


## ----plot1---------------------------------------------------------------
summary_mgwrsar(model_GWR)
plot_mgwrsar(model_GWR,type='B_coef',var='X2')
plot_mgwrsar(model_GWR,type='t_coef',var='X2')

## ----spgwr---------------------------------------------------------------
library(spgwr)
mydataSP=mydata
coordinates(mydataSP)=c('x_lat','y_lon')
ptm1<-proc.time()
model_spgwr <- gwr(Y_gwr~X1+X2+X3, data=mydataSP, bandwidth=0.13,hatmatrix=TRUE)
(proc.time()-ptm1)[3]
head(model_spgwr$SDF@data$gwr.e)
model_spgwr

all(abs(model_GWR$residuals-model_spgwr$SDF@data$gwr.e)<0.00000000001)

## ----GWR2----------------------------------------------------------------
model_GWR<-MGWRSAR(formula = 'Y_gwr~X1+X2+X3', data = mydata,coord=coord, fixed_vars=NULL,kernels=c('bisq_knn'),H=20, Model = 'GWR',control=list(isgcv=TRUE,remove_local_outlier=TRUE,outv=0.01))
summary_mgwrsar(model_GWR)

## ----MGWR1---------------------------------------------------------------

model_MGWR<-MGWRSAR(formula = 'Y_mgwr~X1+X2+X3', data = mydata,coord=coord, fixed_vars=c('Intercept'),kernels=c('gauss_adapt'),H=20, Model = 'MGWR',control=list(SE=TRUE))
summary_mgwrsar(model_MGWR)
                       
                       
### leave-one out CV estimation
model_MGWR<-MGWRSAR(formula = 'Y_mgwr~X1+X2+X3', data = mydata,coord=coord, fixed_vars='Intercept',kernels=c('gauss_adapt'),H=20, Model = 'MGWR',control=list(isgcv=TRUE,remove_local_outlier=FALSE,outv=NULL))
summary_mgwrsar(model_MGWR)



## ----mgwrsar_0_kc_kv-----------------------------------------------------
model_MGWRSAR_1_0_kv<-MGWRSAR(formula = 'Y_mgwrsar_1_0_kv~X1+X2+X3', data = mydata,coord=coord, fixed_vars=NULL,kernels=c('gauss_adapt'),H=20, Model = 'MGWRSAR_1_0_kv',control=list(W=W,Lambdacor=TRUE,SE=TRUE))
summary_mgwrsar(model_MGWRSAR_1_0_kv)

## ----mgwrsar_0_0_kv------------------------------------------------------
model_MGWRSAR_0_kc_kv<-MGWRSAR(formula = 'Y_mgwrsar_0_kc_kv~X1+X2+X3', data = mydata,coord=coord, fixed_vars=c('Intercept'),kernels=c('gauss_adapt'),H=20, Model = 'MGWRSAR_0_kc_kv',control=list(W=W))
summary_mgwrsar(model_MGWRSAR_0_kc_kv)

## ----mgwrsar_1_0_kv------------------------------------------------------
model_MGWRSAR_0_0_kv<-MGWRSAR(formula = 'Y_mgwrsar_0_0_kv~X1+X2+X3', data = mydata,coord=coord, fixed_vars=NULL,kernels=c('gauss_adapt'),H=20, Model = 'MGWRSAR_0_0_kv',control=list(W=W))
summary_mgwrsar(model_MGWRSAR_0_0_kv)

## ----mgwrsar_1_kc_kv-----------------------------------------------------
model_MGWRSAR_1_kc_kv<-MGWRSAR(formula = 'Y_mgwrsar_1_kc_kv~X1+X2+X3', data = mydata,coord=coord, fixed_vars=c('Intercept'),kernels=c('gauss_adapt'),H=20, Model = 'MGWRSAR_1_kc_kv',control=list(W=W))
summary_mgwrsar(model_MGWRSAR_1_kc_kv)

## ----Bootstrap_test, eval=FALSE------------------------------------------
#  model_GWR<-MGWRSAR(formula = 'Y_mgwr~X1+X2+X3', data = mydata,coord=coord, fixed_vars=NULL,kernels=c('gauss_adapt'),H=20, Model = 'GWR',control=list(SE=TRUE))
#  summary_mgwrsar(model_GWR)
#  
#  model_MGWR<-MGWRSAR(formula = 'Y_mgwr~X1+X2+X3', data = mydata,coord=coord, fixed_vars=c('Intercept'),kernels=c('gauss_adapt'),H=20, Model = 'MGWR',control=list(SE=TRUE))
#  summary_mgwrsar(model_MGWR)
#  
#  test<-mgwrsar_bootstrap_test(model_MGWR,model_GWR,B=30,domc=FALSE,ncore=1,type='standard',eps='H1',df='H1',focal='median',D=NULL)
#  
#  # result
#  # > test
#  # > p_star   0
#  # > T 69.92265
#  

## ----Prediction1---------------------------------------------------------
model_GWR_insample<-MGWRSAR(formula = 'Y_gwr~X1+X2+X3', data = mydata[1:800,],coord=coord[1:800,], fixed_vars=NULL,kernels=c('gauss_adapt'),H=8, Model = 'GWR',control=list())
Y_pred=predict_mgwrsar(model_GWR_insample, newdata=mydata[801:1000,], newdata_coord=coord[801:1000,], k_extra = 8, kernel_extra = "sheppard")
head(Y_pred)
head(mydata$Y_gwr[801:1000])
sqrt(mean((mydata$Y_gwr[801:1000]-Y_pred)^2)) # RMSE

## ----Prediction2---------------------------------------------------------
model_MGWRSAR_1_0_kv_insample<-MGWRSAR(formula = 'Y_mgwrsar_1_0_kv~X1+X2+X3', data = mydata[1:800,],coord=coord[1:800,], fixed_vars=NULL,kernels=c('gauss_adapt'),H=20, Model = 'MGWRSAR_1_0_kv',control=list(W=W[1:800,1:800]))
summary_mgwrsar(model_MGWRSAR_1_0_kv_insample)

## Using Best Linear Unbiased Predictor 
Y_pred=predict_mgwrsar(model_MGWRSAR_1_0_kv_insample, newdata=mydata[801:1000,], newdata_coord=coord[801:1000,], k_extra = 12,  W = W, type = "BPN", kernel_extra = "sheppard")
head(Y_pred)
head(mydata$Y_mgwrsar_1_0_kv[801:1000])
sqrt(mean((mydata$Y_mgwrsar_1_0_kv[801:1000]-Y_pred)^2))

## without Best Linear Unbiased Predictor
Y_pred=predict_mgwrsar(model_MGWRSAR_1_0_kv_insample, newdata=mydata[801:1000,], newdata_coord=coord[801:1000,], k_extra = 12,  W = W, type = "TC", kernel_extra = "sheppard")
head(Y_pred)
head(mydata$Y_mgwrsar_1_0_kv[801:1000])
sqrt(mean((mydata$Y_mgwrsar_1_0_kv[801:1000]-Y_pred)^2))

## ----bandwidths_search---------------------------------------------------

######################
#### Finding bandwidth by hand
#####################

model_GWR<-MGWRSAR(formula = 'Y_gwr~X1+X2+X3', data = mydata,coord=coord, fixed_vars=NULL,kernels=c('bisq_knn'),H=50, Model = 'GWR',control=list(isgcv=FALSE,minv=1))
summary_mgwrsar(model_GWR)

myCV<-function(H){
  model_GWR<-MGWRSAR(formula = 'Y_gwr~X1+X2+X3', data = mydata,coord=coord, fixed_vars=NULL,kernels=c('gauss_adapt'),H, Model = 'GWR',control=list(isgcv=TRUE))
  cat('... Try h=',H,' ')
  model_GWR$SSR
}

res=optimize(myCV,upper=500,lower=10)
res


## model with optimal bandwith with adaptative gaussian kernel

model_GWR<-MGWRSAR(formula = 'Y_gwr~X1+X2+X3', data = mydata,coord=coord, fixed_vars=NULL,kernels=c('gauss_adapt'),H=ceiling(res$minimum), Model = 'GWR',control=list(isgcv=FALSE))
summary_mgwrsar(model_GWR)

## ----bandwidths_mgwrsar1-------------------------------------------------
mytab<-bandwidths_mgwrsar(formula = 'Y_gwr~X1+X2+X3', data = mydata,coord=coord, fixed_vars=c('Intercept','X1'),Models=c('GWR','MGWR'),Kernels=c('bisq_knn','gauss_adapt','gauss'),control=list(),control_search=list(lower_d=8,lower_c=0.03,upper_c=0.65))

names(mytab)
names(mytab[['GWR']])

mytab[['GWR']]$config_model
mytab[['GWR']]$CV
summary(mytab[['GWR']]$model$Betav)

mybestmodel=mytab[['GWR']]$model
plot_mgwrsar(mybestmodel,type='B_coef',var='X2')

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

## ----bandwidths_mgwrsar2-------------------------------------------------
mytab2<-bandwidths_mgwrsar(formula = 'Y_mgwrsar_0_kc_kv~X1+X2+X3', data = mydata,coord=coord, fixed_vars='Intercept',Models=c('MGWRSAR_0_kc_kv'),Kernels=c('gauss_adapt'),control=list(),control_search=list(search_W=TRUE,kernels_w=c('bisq','bisq_knn')))



mytab2[['MGWRSAR_0_kc_kv']]$config_model
mytab2[['MGWRSAR_0_kc_kv']]$CV
mytab2[['MGWRSAR_0_kc_kv']]$model$Betac
summary(mytab2[['MGWRSAR_0_kc_kv']]$model$Betav)

## ----EXPERIMENTAL, eval=FALSE--------------------------------------------
#  ## space + time kernel
#  time=sort(rep(1:500,2))
#  time[1:150]
#  W=KNN(coord,8)
#  ### Because only past neighbors are considered, bad choice of bandiwth leads to null weights for first obs ~ it could lead to NAs parameters.
#  
#  model_MGWRSART_0_kc_kv<-MGWRSAR(formula = 'Y_mgwrsar_0_kc_kv~X1+X2+X3', data = mydata,coord=coord, fixed_vars=c('Intercept'),kernels=c('gauss_adapt','gauss_adapt'),H=c(50,50), Model = 'MGWRSAR_0_kc_kv',control=list(Z=time,W=W,Type='GDT'))
#  summary_mgwrsar(model_MGWRSART_0_kc_kv)
#  
#  
#  ### space  + continuous variable kernel
#  model_MGWRSARX_0_kc_kv<-MGWRSAR(formula = 'Y_mgwrsar_0_kc_kv~X1+X2+X3', data = mydata,coord=coord, fixed_vars=c('Intercept'),kernels=c('gauss_adapt','gauss_adapt'),H=c(120,120), Model = 'MGWRSAR_0_kc_kv',control=list(Z=mydata$X2,W=W,Type='GDX'))
#  summary_mgwrsar(model_MGWRSARX_0_kc_kv)
#  
#  
#  ### space + categorical kernel (Li and Racine 2010)
#  Z=as.numeric(mydata$X2>mean(mydata$X2))+1
#  head(Z)
#  
#  model_MGWRSARC_0_kc_kv<-MGWRSAR(formula = 'Y_mgwrsar_0_kc_kv~X1+X2+X3', data = mydata,coord=coord, fixed_vars=c('Intercept'),kernels=c('gauss_adapt','li','li'),H=c(120,0.2,0.8), Model = 'MGWRSAR_0_kc_kv',control=list(Z=Z,W=W,Type='GDC'))
#  summary_mgwrsar(model_MGWRSARX_0_kc_kv)

