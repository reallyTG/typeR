library(FusionLearn)


### Name: fusionbase
### Title: Fusion learning method for continuous responses
### Aliases: fusionbase fusionbase.fit

### ** Examples

##analysis of the stock index data
#Responses contain indices "VIX","GSPC", and "DJI" 
y <- list(stockindexVIX[,1],stockindexGSPC[,1],stockindexDJI[,1]) 

#Predictors include 46 stocks
x <- list(stockindexVIX[,2:47],stockindexGSPC[,2:47],stockindexDJI[,2:47])  

##Implementing the model selection algorithm based on the psuedolikelihood 
##information criteria  
model <- fusionbase.fit(x,y,seq(0.03,5,length.out = 10),232,46,3,depen="CORR")
lambda <- model[which.min(model[,2]),1]
result <- fusionbase(x,y,lambda,232,46,3)

##Identify the significant predictors for the three indices
id <- which(result$beta[,1]!=0)+1
colnames(stockindexVIX)[id]



