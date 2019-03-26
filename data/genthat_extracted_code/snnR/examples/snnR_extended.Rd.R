library(snnR)


### Name: snnR_extended
### Title: snnR_extended
### Aliases: snnR_extended

### ** Examples

## No test: 
###############################################################
#Example 1
  #Jersey dataset
   data(Jersey) 
  #Fit the model with Additive and Dominant effects
   y<-as.vector(pheno$yield_devMilk)
   X_test<-G[partitions==2,]
   X_train<-G[partitions!=2,]
   y_test<-y[partitions==2]
   y_train<-y[partitions!=2]
   Z_test<-D[partitions==2,]
   Z_train<-D[partitions!=2,]
   #Generate the structure of neural network   
   nHidden_add <- matrix(c(5,10,5),1,3)
   nHidden_dom <- matrix(c(5,15,5),1,3)
   # call function to train the sparse nerual network 
   network=snnR_extended(x=X_train,y=y_train,
   z=Z_train,nHidden_add=nHidden_add,nHidden_dom=nHidden_dom,iteramax =10,normalize=TRUE)
   # predictive results
   yhat= predict(network,X_test,Z_test)
   plot(y_test,yhat)

## End(No test)




