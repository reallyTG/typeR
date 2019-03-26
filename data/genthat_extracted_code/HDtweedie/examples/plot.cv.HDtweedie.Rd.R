library(HDtweedie)


### Name: plot.cv.HDtweedie
### Title: plot the cross-validation curve produced by cv.HDtweedie
### Aliases: plot.cv.HDtweedie
### Keywords: models regression

### ** Examples

# load HDtweedie library
library(HDtweedie)

# load data set
data(auto)

# 5-fold cross validation using the lasso
cv0 <- cv.HDtweedie(x=auto$x,y=auto$y,p=1.5,nfolds=5,lambda.factor=.0005)

# make a CV plot
plot(cv0)

# define group index
group1 <- c(rep(1,5),rep(2,7),rep(3,4),rep(4:14,each=3),15:21)

# 5-fold cross validation using the grouped lasso 
cv1 <- cv.HDtweedie(x=auto$x,y=auto$y,group=group1,p=1.5,nfolds=5,lambda.factor=.0005)

# make a CV plot
plot(cv1)



