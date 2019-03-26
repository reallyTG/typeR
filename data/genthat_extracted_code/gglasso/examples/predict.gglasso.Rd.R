library(gglasso)


### Name: predict.gglasso
### Title: make predictions from a "gglasso" object.
### Aliases: predict.gglasso
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

# predicted class label at x[10,]
print(predict(m1,type="class",newx=colon$x[10,]))

# predicted linear predictors at x[1:5,]
print(predict(m1,type="link",newx=colon$x[1:5,]))



