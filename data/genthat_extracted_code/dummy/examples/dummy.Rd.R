library(dummy)


### Name: dummy
### Title: Automatic Dummy Variable Creation with Support for Predictive
###   Contexts
### Aliases: dummy

### ** Examples

#create toy data
(traindata <- data.frame(var1=as.factor(c("a","b","b","c")),
                         var2=as.factor(c(1,1,2,3)),
                         var3=c("val1","val2","val3","val3"),
                         stringsAsFactors=FALSE))
(newdata <- data.frame(var1=as.factor(c("a","b","b","c","d","d")),
                       var2=as.factor(c(1,1,2,3,4,5)),
                       var3=c("val1","val2","val3","val3","val4","val4"),
                       stringsAsFactors=FALSE))
#create dummies of training set
(dummies_train <- dummy(x=traindata))
#create dummies of new set
(dummies_new <- dummy(x=newdata))

#how many new dummy variables should not have been created?
sum(! colnames(dummies_new) %in% colnames(dummies_train))

#create dummies of new set using categories found in training set
(dummies_new <- dummy(x=newdata,object=categories(traindata,p="all")))

#how many new dummy variables should not have be created?
sum(! colnames(dummies_new) %in% colnames(dummies_train))


#create dummies of training set,
#using the top 2 categories of all variables found in the training data
dummy(x=traindata,p=2)

#create dummies of training set,
#using respectively the top 2,3 and 1 categories of the three
#variables found in training data
dummy(x=traindata,p=c(2,3,1))

#create all dummies of training data
dummy(x=traindata)



