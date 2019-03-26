library(OutlierDetection)


### Name: disp
### Title: Outlier detection using genralised dispersion
### Aliases: disp

### ** Examples

#Create dataset
X=iris[,1:4]
#Outlier detection
disp(X,cutoff=0.99)



