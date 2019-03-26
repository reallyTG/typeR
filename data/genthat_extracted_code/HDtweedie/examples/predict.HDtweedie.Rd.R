library(HDtweedie)


### Name: predict.HDtweedie
### Title: make predictions from a "HDtweedie" object.
### Aliases: predict.HDtweedie
### Keywords: models regression

### ** Examples

# load HDtweedie library
library(HDtweedie)

# load auto data set
data(auto)

# fit the lasso
m0 <- HDtweedie(x=auto$x,y=auto$y,p=1.5)

# predicted mean response at x[10,]
print(predict(m0,type="response",newx=auto$x[10,]))

# define group index
group1 <- c(rep(1,5),rep(2,7),rep(3,4),rep(4:14,each=3),15:21)

# fit the grouped lasso
m1 <- HDtweedie(x=auto$x,y=auto$y,group=group1,p=1.5)

# predicted the log mean response at x[1:5,]
print(predict(m1,type="link",newx=auto$x[1:5,]))



