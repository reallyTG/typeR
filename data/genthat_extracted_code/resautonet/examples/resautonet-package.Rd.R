library(resautonet)


### Name: resautonet-package
### Title: Autoencoder-based Residual Deep Network with Keras Support
### Aliases: resautonet-package resautonet
### Keywords: package

### ** Examples

## No test: 
###### Generate the data
#Sample size 
library(dplyr)

n=4000 
#Number of features 
nfea=4
#Generate the dataset with normalization of the covariates  
cmdStr="data.frame("
for(i in c(1:nfea)){
  var=runif(n,runif(1,1,5),runif(1,100,200))
  varName=paste("x",i,sep="")
  assign(varName,var)
  cmdStr=paste(cmdStr,varName,"n=(",varName,"-mean(",varName,"))/sd(",varName,")",sep="")
  if(i<nfea)
    cmdStr=paste(cmdStr,",",sep="")
}
cmdStr=paste(cmdStr,")",sep="")
dataset=eval(expr=parse(text=cmdStr))
y=sin(x1)+2*cos(x2)+x3^2+sqrt(x4)+rnorm(n)
#Normalization of y 
yn=(y-mean(y))/sd(y)
#Obtain the index of training and test samples 
prop=0.2
test_index=sample(c(1:n),size=ceiling(n*prop))
train_index=setdiff(c(1:n),test_index) 

#Obtain the training and test dataset 
x_train=as.matrix(dataset[train_index,])
y_train=as.vector(yn[train_index])
 
x_test=as.matrix(dataset[test_index,])
y_test=as.vector(yn[test_index])

#Define the metric, r2 in keras 
metric_r2= keras::custom_metric("rsquared", function(y_true, y_pred) {
  SS_res =keras::k_sum(keras::k_square(y_true-y_pred ))
  SS_tot =keras::k_sum(keras::k_square(( y_true - keras::k_mean(y_true))))
  return ( 1 - SS_res/(SS_tot + keras::k_epsilon()))
})

#Define the autoencoder-based deep network 
nout=1;nodes=c(16,8,4,2);mdropout=0.2;isres=TRUE;outtype=0;fact="linear"
acts=rep("relu",length(nodes));fact="linear";reg=NULL;batchnorm=TRUE
autoresmodel=resautonet::AutoEncoderModel(nfea,nout,nodes,
      acts,mdropout,reg,batchnorm,isres,outtype,fact=fact)
autoresmodel %>% keras::compile(
  loss = "mean_squared_error",
  optimizer = keras::optimizer_rmsprop(),
  metrics = c("mean_squared_error",metric_r2)
)
#Show the network 
summary(autoresmodel)

early_stopping = keras::callback_early_stopping(monitor ='loss', min_delta=0.0000001,patience=10)
reduce=keras::callback_reduce_lr_on_plateau(patience=10)

nepoch=10
#Train the network 
history <- autoresmodel %>% keras::fit(
  x_train, y_train, 
  epochs = nepoch, batch_size = 60, callbacks=list(early_stopping,reduce),
  validation_split = 0.2,verbose=0
)
#Predict the test samples 
pred = autoresmodel %>% predict(x_test,batch_size = 30)
pred=pred*sd(y)+mean(y) 
y_test=y_test*sd(y)+mean(y)

#Test results 
testr2=r2_squ(y_test,y_test-pred)
testrmse=rmse(y_test,pred)

#Print the results 
print(paste("R2: regular ",round(max(history$metrics$rsquared),3),
            ";validation ",round(max(history$metrics$val_rsquared),3),
            ";test ",round(testr2,3),sep=""))
print(paste("RMSE: regular ",round(min(history$metrics$mean_squared_error),3),
            ";validation ",round(min(history$metrics$val_mean_squared_error),3),
            ";test ",round(testrmse,3),sep=""))
## End(No test)



