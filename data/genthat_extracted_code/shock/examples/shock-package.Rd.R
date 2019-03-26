library(shock)


### Name: shock-package
### Title: Slope Heuristic for Block-Diagonal Covariance Selection in High
###   Dimensional Gaussian Graphical Models
### Aliases: shock-package shock

### ** Examples


## load data to test 
data(dataTest)

## dimension of the dataset expdata
n <- dim(dataTest)[1]
p <- dim(dataTest)[2]

## perform partition of variables selection
## based on the slope heuristic
resShock <- shockSelect(dataTest)


## verify that the two slope heuristic 
## calibrations give the same result
table(resShock$SHDJlabels == resShock$SHRRlabels)

## collect the labels of variables 
SHlabels  <- resShock$SHDJlabels

## SHadjaMat: adjacency matrix of the inferred network
## Shock network inference 
SHadjaMat<- diag(p)
for(itt in 1:length(unique(SHlabels))){  
  stepdata <- as.matrix(dataTest[,SHlabels==itt],nrow=dim(dataTest)[1])
  if(dim(stepdata)[2]>1){
    resNet <- networkInferenceGlassoBIC(stepdata)
    SHadjaMat[SHlabels==itt,SHlabels==itt] <- resNet$A
  }
}





