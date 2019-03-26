library(gglasso)


### Name: gglasso
### Title: Fits the regularization paths for group-lasso penalized learning
###   problems
### Aliases: gglasso
### Keywords: models regression

### ** Examples

# load gglasso library
library(gglasso)

# load bardet data set
data(bardet)

# define group index
group1 <- rep(1:20,each=5)

# fit group lasso penalized least squares
m1 <- gglasso(x=bardet$x,y=bardet$y,group=group1,loss="ls")

# load colon data set
data(colon)

# define group index
group2 <- rep(1:20,each=5)

# fit group lasso penalized logistic regression
m2 <- gglasso(x=colon$x,y=colon$y,group=group2,loss="logit")



