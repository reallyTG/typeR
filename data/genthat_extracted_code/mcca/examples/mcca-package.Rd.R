library(mcca)


### Name: mcca-package
### Title: diagnostic accuracy methods for classifiers
### Aliases: mcca-package mcca
### Keywords: CCP HUM IDI

### ** Examples


rm(list=ls())
str(iris)
data <- iris[, 1:4]
label <- iris[, 5]
ccp(y = label, d = data, method = "multinom", k = 3,maxit = 1000,MaxNWts = 2000,trace=FALSE)
## [1] 0.9866667
ccp(y = label, d = data, method = "multinom", k = 3)
## [1] 0.9866667
ccp(y = label, d = data, method = "svm", k = 3)
## [1] 0.9733333
ccp(y = label, d = data, method = "svm", k = 3,kernel="sigmoid",cost=4,scale=TRUE,coef0=0.5)
## [1] 0.8333333
ccp(y = label, d = data, method = "tree", k = 3)
## [1] 0.96
p = as.numeric(label)
ccp(y = label, d = p, method = "label", k = 3)
## [1] 1
hum(y = label, d = data,method = "multinom", k = 3)
## [1] 0.9972
hum(y = label, d = data,method = "svm", k = 3)
## [1] 0.9964
hum(y = label, d = data,method = "svm", k = 3,kernel="linear",cost=4,scale=TRUE)
## [1] 0.9972
hum(y = label, d = data, method = "tree", k = 3)
## [1] 0.998
## No test: 
ests(y = label, d = data,acc="hum",level=0.95,method = "multinom", k = 3,trace=FALSE)
## End(No test)

## $value
## [1] 0.9972

## $sd
## [1] 0.002051529

## $interval
## [1] 0.9935662 1.0000000



