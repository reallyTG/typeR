library(ModelGood)


### Name: plot.Roc
### Title: ROC curves for risk prediction models
### Aliases: plot.Roc

### ** Examples

# generate som data
set.seed(40)
N=40
Y=rbinom(N,1,.5)
X1=rnorm(N)
X1[Y==1]=rnorm(sum(Y==1),mean=rbinom(sum(Y==1),1,.5))
X2=rnorm(N)
X2[Y==0]=rnorm(sum(Y==0),mean=rbinom(sum(Y==0),1,.5))
dat <- data.frame(Y=Y,X1=X1,X2=X2)

# fit two logistic regression models
lm1 <- glm(Y~X1,data=dat,family="binomial")
lm2 <- glm(Y~X2+X1,data=dat,family="binomial")
plot(Roc(list(lm1,lm2),data=dat))

# add the area under the curves

plot(Roc(list(lm1,lm2),data=dat),auc=TRUE)

# alternatively, one can directly work with formula objects:
plot(Roc(list(LR.X1=Y~X1,LR.X1.X2=Y~X2+X1),data=dat),auc=TRUE)

# beyond the logistic regression model.
# the following example is optimized for speed
# illustrating the syntax,
# and not for optimized for performance of the
# randomForest or elastic net
library(randomForest)
library(glmnet)
dat$Y=factor(dat$Y)
rf <- randomForest(Y~X1+X2,data=dat,ntree=10)
en <- ElasticNet(Y~X1+X2,data=dat,nfolds=10,alpha=0.1)
set.seed(6)
rocCV=Roc(list(RandomForest=rf,ElasticNet=en,LogisticRegression=lm2),
  data=dat,
  verbose=FALSE,
  splitMethod="bootcv",
  B=4,
  cbRatio=1)
plot(rocCV,yaxis.las=2,legend.title="4 bootstrap-crossvalidation steps")



