library(ModelGood)


### Name: ElasticNet
### Title: Wrapper function for glmnet
### Aliases: ElasticNet

### ** Examples

# Generate some data with binary response Y
 # depending on X1 and X2 and X1*X2
set.seed(40)
N <- 40
X1 <- rnorm(N)
X2 <- rbinom(N,1,.4)
X3 <- rnorm(N)
expit <- function(x) exp(x)/(1+exp(x))
lp <- expit(1 + X1 + X2 + X3)
Y <- factor(rbinom(N,1,lp))
dat <- data.frame(Y=Y,X1=X1,X2=X2,X3=X3)

efit <- ElasticNet(Y~X1+X2+X3,data=dat,family="binomial",alpha=0.1)
Brier(efit,verbose=FALSE)



