library(IPMRF)


### Name: ipmrfnew
### Title: IPM casewise with CART-RF by 'randomForest' for new cases, whose
###   responses do not need to be known
### Aliases: ipmrfnew
### Keywords: tree multivariate

### ** Examples

#Note: more examples can be found at 
#https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-017-1650-8


library(mlbench)
#data used by Breiman, L.: Random forests. Machine Learning 45(1), 5--32 (2001)
data(PimaIndiansDiabetes2) 
Diabetes <- na.omit(PimaIndiansDiabetes2)

set.seed(2016)
require(randomForest)
ri<- randomForest(diabetes  ~ ., data=Diabetes, ntree=500, importance=TRUE,
keep.inbag=TRUE,replace = FALSE) 

#new cases
da1=rbind(apply(Diabetes[Diabetes[,9]=='pos',1:8],2,mean),
apply(Diabetes[Diabetes[,9]=='neg',1:8],2,mean))


#IPM case-wise computed for new cases for randomForest package
ntree=500
pupfn=ipmrfnew(ri, as.data.frame(da1),ntree)
pupfn




