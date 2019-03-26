library(HDtweedie)


### Name: HDtweedie
### Title: Fits the regularization paths for lasso-type methods of the
###   Tweedie model
### Aliases: HDtweedie
### Keywords: models regression

### ** Examples

# load HDtweedie library
library(HDtweedie)

# load auto data set
data(auto)

# fit the lasso
m0 <- HDtweedie(x=auto$x,y=auto$y,p=1.5)

# define group index
group1 <- c(rep(1,5),rep(2,7),rep(3,4),rep(4:14,each=3),15:21)

# fit the grouped lasso
m1 <- HDtweedie(x=auto$x,y=auto$y,group=group1,p=1.5)

# fit the grouped elastic net
m2 <- HDtweedie(x=auto$x,y=auto$y,group=group1,p=1.5,alpha=0.7)



