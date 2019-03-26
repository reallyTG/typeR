library(OutlierDetection)


### Name: UnivariateOutlierDetection
### Title: Univariate Outlier Detection(Intersection of all the methods)
### Aliases: UnivariateOutlierDetection

### ** Examples

#Create dataset
X=iris[,1:4]
#Outlier detection
depthout(X,cutoff=0.05)
UnivariateOutlierDetection(iris[,1],cutoff=.95,Method="euclidean",rnames=FALSE)



