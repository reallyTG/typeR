library(gglasso)


### Name: coef.gglasso
### Title: get coefficients or make coefficient predictions from an
###   "gglasso" object.
### Aliases: coef.gglasso
### Keywords: models regression

### ** Examples

# load gglasso library
library(gglasso)

# load data set
data(colon)

# define group index
group <- rep(1:20,each=5)

# fit group lasso
m1 <- gglasso(x=colon$x,y=colon$y,group=group,loss="logit")

# the coefficients at lambda = 0.01 and 0.02
coef(m1,s=c(0.01,0.02))



