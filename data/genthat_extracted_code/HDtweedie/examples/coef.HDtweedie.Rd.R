library(HDtweedie)


### Name: coef.HDtweedie
### Title: get coefficients or make coefficient predictions from an
###   "HDtweedie" object.
### Aliases: coef.HDtweedie
### Keywords: models regression

### ** Examples

# load HDtweedie library
library(HDtweedie)

# load data set
data(auto)

# fit the lasso
m0 <- HDtweedie(x=auto$x,y=auto$y,p=1.5)

# the coefficients at lambda = 0.01
coef(m0,s=0.01)

# define group index
group1 <- c(rep(1,5),rep(2,7),rep(3,4),rep(4:14,each=3),15:21)

# fit grouped lasso
m1 <- HDtweedie(x=auto$x,y=auto$y,group=group1,p=1.5)

# the coefficients at lambda = 0.01 and 0.04
coef(m1,s=c(0.01,0.04))



