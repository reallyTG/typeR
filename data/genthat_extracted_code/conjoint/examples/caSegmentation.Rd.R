library(conjoint)


### Name: caSegmentation
### Title: Function caSegmentation divides respondents on clusters
### Aliases: caSegmentation
### Keywords: multivariate

### ** Examples

#Example 1
library(conjoint)
require(fpc)
data(tea)
segments<-caSegmentation(tprefm,tprof)
print(segments$seg)
plotcluster(segments$util,segments$sclu)

#Example 2
library(conjoint)
require(fpc)
data(tea)
segments<-caSegmentation(tpref,tprof,3)
print(segments$seg)
plotcluster(segments$util,segments$sclu)

#example 3
library(conjoint)
require(fpc)
require(broom)
require(ggplot2)
data(tea)
segments<-caSegmentation(tprefm,tprof,3)
dcf<-discrcoord(segments$util,segments$sclu)
assignments<-augment(segments$segm,dcf$proj[,1:2])
ggplot(assignments)+geom_point(aes(x=X1,y=X2,color= .cluster))+labs(color="Cluster Assignment",
title="K-Means Clustering Results")

#Example 4
library(conjoint)
require(ggfortify)
data(tea)
segments<-caSegmentation(tpref,tprof,3)
print(segments$seg)
util<-as.data.frame(segments$util)
set.seed(123)
ggplot2::autoplot(kmeans(util,3),data=util,label=TRUE,label.size=4,frame=TRUE)

#Example 5
#library(conjoint)
#require(ggfortify)
#require(cluster)
#data(tea)
#segments<-caSegmentation(tpref,tprof,3)
#print(segments$seg)
#util<-as.data.frame(segments$util)
#ggplot2::autoplot(pam(util,3),label=TRUE,label.size=4,frame=TRUE,frame.type='norm')



