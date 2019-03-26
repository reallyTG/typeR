library(OutlierDetection)


### Name: dens
### Title: Outlier detection using Robust Kernal-based Outlier Factor(RKOF)
###   algorithm
### Aliases: dens

### ** Examples

#Create dataset
X=iris[,1:4]
#Outlier detection
dens(X,k=4,C=1)



