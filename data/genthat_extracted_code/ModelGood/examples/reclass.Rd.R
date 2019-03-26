library(ModelGood)


### Name: reclass
### Title: Risk reclassification table
### Aliases: reclass

### ** Examples

set.seed(40)
N <- 40
X1 <- rnorm(N)
X2 <- rbinom(N,1,.4)
X3 <- rnorm(N)
expit <- function(x) exp(x)/(1+exp(x))
lp <- expit(X1 + X2 + X3)
Y <- factor(rbinom(N,1,lp))
dat <- data.frame(Y=Y,X1=X1,X2=X2,X3=X3)
lm1 <- glm(Y~X1,data=dat,family="binomial")
lm2 <- glm(Y~X1+X2,data=dat,family="binomial")

rc <- reclass(list("lrm.X1"=lm1,"lrm.X1.X2"=lm2),newdata=dat)
print(rc)
plot(rc)

rc2 <- reclass(list("lrm.X1"=lm1,"lrm.X1.X2"=lm2),newdata=dat,cuts=c(0,5,10,50,100))
print(rc2)
plot(rc2)



