library(OutlierDetection)


### Name: maha
### Title: Outlier detection using Mahalanobis Distance
### Aliases: maha

### ** Examples

#Create dataset
X=iris[,1:4]
#Outlier detection
maha(X,cutoff=0.9)



