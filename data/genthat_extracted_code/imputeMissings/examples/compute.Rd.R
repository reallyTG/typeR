library(imputeMissings)


### Name: compute
### Title: Compute the missing values to later impute them in another
###   dataset
### Aliases: compute

### ** Examples

#Compute the values on a training dataset and impute them on new data.
#This is very convenient in predictive contexts. For example:

#define training data
(train <- data.frame(v_int=as.integer(c(3,3,2,5,1,2,4,6)),
                 v_num=as.numeric(c(4.1,NA,12.2,11,3.4,1.6,3.3,5.5)),
                 v_fact=as.factor(c('one','two',NA,'two','two','one','two','two')),
                 stringsAsFactors = FALSE))

#Compute values on train data
#randomForest method
values <- compute(train, method="randomForest")
#median/mode method
values2 <- compute(train)

#define new data
(newdata <- data.frame(v_int=as.integer(c(1,1,2,NA)),
                 v_num=as.numeric(c(1.1,NA,2.2,NA)),
                 v_fact=as.factor(c('one','one','one',NA)),
                 stringsAsFactors = FALSE))

#locate the NA's
is.na(newdata)
#how many missings per variable?
colSums(is.na(newdata))

#Impute on newdata
impute(newdata,object=values) #using randomForest values
impute(newdata,object=values2) #using median/mode values

#One can also impute directly in newdata without the compute step
impute(newdata)

#Flag parameter
impute(newdata,flag=TRUE)



