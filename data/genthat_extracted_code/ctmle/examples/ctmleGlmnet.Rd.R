library(ctmle)


### Name: ctmleGlmnet
### Title: Collaborative Targeted Maximum Likelihood Estimation for
###   hyper-parameter tuning of LASSO
### Aliases: ctmleGlmnet

### ** Examples

## Not run: 
##D set.seed(123)
##D N <- 1000
##D p = 10
##D Wmat <- matrix(rnorm(N * p), ncol = p)
##D beta1 <- 4+2*Wmat[,1]+2*Wmat[,2]+2*Wmat[,5]+2*Wmat[,6]+2*Wmat[,8]
##D beta0 <- 2+2*Wmat[,1]+2*Wmat[,2]+2*Wmat[,5]+2*Wmat[,6]+2*Wmat[,8]
##D tau <- 2
##D gcoef <- matrix(c(-1,-1,rep(0,(p)-2)),ncol=1)
##D Wm <- as.matrix(Wmat)
##D g <- 1/(1+exp(Wm%*%gcoef / 3))
##D A <- rbinom(N, 1, prob = g)
##D sigma <- 1
##D epsilon <-rnorm(N,0,sigma)
##D Y  <- beta0 + tau * A + epsilon
##D # ctmleGlmnet must provide user-specified Q
##D W_tmp <- data.frame(Wm[,1:3])
##D treated<- W_tmp[which(A==1),]
##D untreated<-W_tmp[which(A==0),]
##D Y1<-Y[which(A==1)]
##D Y0<-Y[which(A==0)]
##D # Initial Q-estimate
##D beta1hat <- predict(lm(Y1~.,data=treated),newdata=W_tmp)
##D beta0hat <- predict(lm(Y0~., data=untreated),newdata=W_tmp)
##D Q <- matrix(c(beta0hat,beta1hat),ncol=2)
##D W = Wm
##D glmnet_fit <- cv.glmnet(y = A, x = Wm,
##D                        family = 'binomial', nlambda = 40)
##D start = which(glmnet_fit$lambda==glmnet_fit$lambda.min))
##D end = length(glmnet_fit$lambda)
##D lambdas <-glmnet_fit$lambda[start:end]
##D ctmle_fit1 <- ctmleGlmnet(Y=Y, A=A,
##D                          W=data.frame(W=W),
##D                          Q = Q, lambdas = lambdas,
##D                          ctmletype=1, alpha=.995,
##D                          family="gaussian",
##D                          gbound=0.025,like_type="loglik" ,
##D                          fluctuation="logistic",
##D                          verbose=FALSE,
##D                          detailed=FALSE, PEN=FALSE,
##D                          V=5, stopFactor=10^6)
## End(Not run)



