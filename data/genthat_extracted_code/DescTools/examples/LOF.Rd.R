library(DescTools)


### Name: LOF
### Title: Local Outlier Factor
### Aliases: LOF
### Keywords: methods

### ** Examples

# Detecting the top 10 outliers using the LOF algorithm

(iris.lof <- LOF(iris[,-5], 10))



