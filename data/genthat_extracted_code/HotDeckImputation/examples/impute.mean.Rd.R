library(HotDeckImputation)


### Name: impute.mean
### Title: Attribute Wise Mean Imputation
### Aliases: impute.mean
### Keywords: NA manip

### ** Examples

#Set the random seed to an arbitrary number
set.seed(421)

#Generate matrix of random integers
Y<-matrix(sample(0:9,replace=TRUE,size=6*3),nrow=6)

#generate 6 missing values, MCAR, in all but the first row
Y[-1,][sample(1:12,size=6)]<-NA

#Impute the colMeans of Y
impute.mean(DATA=Y)



