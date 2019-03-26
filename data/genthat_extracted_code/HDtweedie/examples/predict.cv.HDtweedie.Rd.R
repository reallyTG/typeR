library(HDtweedie)


### Name: predict.cv.HDtweedie
### Title: make predictions from a "cv.HDtweedie" object.
### Aliases: predict.cv.HDtweedie
### Keywords: models regression

### ** Examples

# load HDtweedie library
library(HDtweedie)

# load data set
data(auto)

# 5-fold cross validation using the lasso
cv0 <- cv.HDtweedie(x=auto$x,y=auto$y,p=1.5,nfolds=5) 

# predicted mean response at lambda = lambda.1se, newx = x[1,]
pre = predict(cv0, newx = auto$x[1,], type = "response")

# define group index
group1 <- c(rep(1,5),rep(2,7),rep(3,4),rep(4:14,each=3),15:21)

# 5-fold cross validation using the grouped lasso 
cv1 <- cv.HDtweedie(x=auto$x,y=auto$y,group=group1,p=1.5,nfolds=5)

# predicted the log mean response at lambda = lambda.min, x[1:5,]
pre = predict(cv1, newx = auto$x[1:5,], s = cv1$lambda.min, type = "link")



