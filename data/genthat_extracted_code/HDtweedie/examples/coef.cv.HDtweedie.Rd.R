library(HDtweedie)


### Name: coef.cv.HDtweedie
### Title: get coefficients or make coefficient predictions from a
###   "cv.HDtweedie" object.
### Aliases: coef.cv.HDtweedie
### Keywords: models regression

### ** Examples

# load HDtweedie library
library(HDtweedie)

# load data set
data(auto)

# 5-fold cross validation using the lasso
cv0 <- cv.HDtweedie(x=auto$x,y=auto$y,p=1.5,nfolds=5)

# the coefficients at lambda = lambda.1se
coef(cv0)

# define group index
group1 <- c(rep(1,5),rep(2,7),rep(3,4),rep(4:14,each=3),15:21)

# 5-fold cross validation using the grouped lasso 
cv1 <- cv.HDtweedie(x=auto$x,y=auto$y,group=group1,p=1.5,nfolds=5)

# the coefficients at lambda = lambda.min
coef(cv1, s = cv1$lambda.min)



