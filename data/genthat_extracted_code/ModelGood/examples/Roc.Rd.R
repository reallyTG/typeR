library(ModelGood)


### Name: Roc
### Title: Comparing prediction models with Receiver operating
###   characteristics and Brier scores
### Aliases: Brier Brier.glm Brier.list Brier.lrm Brier.randomForest
###   Brier.rpart Roc Roc.glm Roc.list Roc.lrm Roc.randomForest Roc.rpart
### Keywords: models

### ** Examples

## Generate some data with binary response Y
## depending on X1 and X2 and X1*X2
set.seed(40)
N <- 40
X1 <- rnorm(N)
X2 <- abs(rnorm(N,4))
X3 <- rbinom(N,1,.4)
expit <- function(x) exp(x)/(1+exp(x))
lp <- expit(-2 + X1 + X2 + X3 - X3*X2)
Y <- factor(rbinom(N,1,lp))
dat <- data.frame(Y=Y,X1=X1,X2=X2)

# single markers, one by one
r1 <- Roc(Y~X1,data=dat)
plot(r1,col=1)
r2 <- Roc(Y~X2,data=dat)
lines(r2,col=2)

# or, directly multiple in one
r12 <- Roc(list(Y~X1,Y~X2),data=dat)
plot(r12)

## compare logistic regression
lm1 <- glm(Y~X1,data=dat,family="binomial")
lm2 <- glm(Y~X1+X2,data=dat,family="binomial")
r1=Roc(list(LR.X1=lm1,LR.X1.X2=lm2))
summary(r1)
Brier(list(lm1,lm2))

# machine learning
library(randomForest)
dat$Y=factor(dat$Y)
rf <- randomForest(Y~X2,data=dat)
rocCV=Roc(list(RandomForest=rf,LogisticRegression=lm2),
    data=dat,
    splitMethod="bootcv",
    B=3,
    cbRatio=1)
plot(rocCV)

# compute .632+ estimate of Brier score
bs <- Brier(list(LR.X1=lm1,LR.X2=lm2),
    data=dat,
    splitMethod="boot632+",
    B=3)
bs
#'



