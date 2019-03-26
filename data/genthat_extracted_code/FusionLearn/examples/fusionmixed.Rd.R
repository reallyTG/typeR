library(FusionLearn)


### Name: fusionmixed
### Title: Fusion learning algorithm for mixed data
### Aliases: fusionmixed fusionmixed.fit

### ** Examples

##Analysis of the index data

#Responses contain indices "VIX","GSPC", and "DJI",  
#"DJI" is dichotomized into "increasing" or "decreasing"
y <- list(stockindexVIX[,1],stockindexGSPC[,1],stockindexDJI[,1]>0)

#Predictors include 46 stocks
x <- list(stockindexVIX[,2:47],stockindexGSPC[,2:47],stockindexDJI[,2:47])  
##Implementing the model selection based on psuedolikelihood 
##information criteria
model <- fusionmixed.fit(x,y,seq(0.03,5,length.out = 10),232,46,2,1,depen="CORR")
lambda <- model[which.min(model[,2]),1]  
result <- fusionmixed(x,y,lambda,232,46,2,1)

##Identify the significant predictors for three indices
id <- which(result$beta[,1]!=0)+1
colnames(stockindexVIX)[id]





