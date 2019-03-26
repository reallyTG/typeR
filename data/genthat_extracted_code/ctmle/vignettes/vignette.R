## ----eval=TRUE-----------------------------------------------------------
library(ctmle)
library(dplyr)
set.seed(123)

N <- 1000
p = 5
Wmat <- matrix(rnorm(N * p), ncol = p)
beta1 <- 4+2*Wmat[,1]+2*Wmat[,2]+2*Wmat[,5]
beta0 <- 2+2*Wmat[,1]+2*Wmat[,2]+2*Wmat[,5]
tau <- 2
gcoef <- matrix(c(-1,-1,rep(-(3/((p)-2)),(p)-2)),ncol=1)
W <- as.matrix(Wmat)

g <- 1/(1+exp(W%*%gcoef /3))
A <- rbinom(N, 1, prob = g)

epsilon <-rnorm(N, 0, 1)
Y  <- beta0 + tau * A + epsilon

# With initial estimate of Q
Q <- cbind(rep(mean(Y[A == 0]), N), rep(mean(Y[A == 1]), N))

time_greedy <- system.time(
      ctmle_discrete_fit1 <- ctmleDiscrete(Y = Y, A = A, W = data.frame(Wmat), Q = Q,
                                           preOrder = FALSE, detailed = TRUE)
)
ctmle_discrete_fit2 <- ctmleDiscrete(Y = Y, A = A, W = data.frame(Wmat),
                                     preOrder = FALSE, detailed = TRUE)


time_preorder <- system.time(
      ctmle_discrete_fit3 <- ctmleDiscrete(Y = Y, A = A, W = data.frame(Wmat), Q = Q,
                                           preOrder = TRUE,
                                           order = rev(1:p), detailed = TRUE)
)

## ----eval = TRUE---------------------------------------------------------
time_greedy
time_preorder

## ----eval = TRUE---------------------------------------------------------
ctmle_discrete_fit1

## ----eval = TRUE---------------------------------------------------------
summary(ctmle_discrete_fit1)

## ----eval = TRUE---------------------------------------------------------
# Generate high-dimensional data
set.seed(123)

N <- 1000
p = 100
Wmat <- matrix(rnorm(N * p), ncol = p)
beta1 <- 4+2*Wmat[,1]+2*Wmat[,2]+2*Wmat[,5]+2*Wmat[,6]+2*Wmat[,8]
beta0 <- 2+2*Wmat[,1]+2*Wmat[,2]+2*Wmat[,5]+2*Wmat[,6]+2*Wmat[,8]
tau <- 2
gcoef <- matrix(c(-1,-1,rep(-(3/((p)-2)),(p)-2)),ncol=1)
W <- as.matrix(Wmat)

g <- 1/(1+exp(W%*%gcoef /3))
A <- rbinom(N, 1, prob = g)

epsilon <-rnorm(N, 0, 1)
Y  <- beta0 + tau * A + epsilon

# With initial estimate of Q
Q <- cbind(rep(mean(Y[A == 0]), N), rep(mean(Y[A == 1]), N))

glmnet_fit <- cv.glmnet(y = A, x = W, family = 'binomial', nlambda = 20)

## ------------------------------------------------------------------------
lambdas <-glmnet_fit$lambda[(which(glmnet_fit$lambda==glmnet_fit$lambda.min)):length(glmnet_fit$lambda)]

## ------------------------------------------------------------------------
time_ctmlelasso1 <- system.time(
      ctmle_fit1 <- ctmleGlmnet(Y = Y, A = A,
                                W = data.frame(W = W),
                                Q = Q, lambdas = lambdas, ctmletype=1, 
                                family="gaussian",gbound=0.025, V=5)
)

## ------------------------------------------------------------------------
time_ctmlelasso2 <- system.time(
      ctmle_fit2 <- ctmleGlmnet(Y = Y, A = A,
                                W = data.frame(W = W),
                                Q = Q, lambdas = lambdas, ctmletype=2, 
                                family="gaussian",gbound=0.025, V=5)
)

## ------------------------------------------------------------------------
gcv <- predict.cv.glmnet(glmnet_fit, newx=W, s="lambda.min",type="response")
gcv <- bound(gcv,c(0.025,0.975))

s_prev <- glmnet_fit$lambda[(which(glmnet_fit$lambda == glmnet_fit$lambda.min))] * (1+5e-2)
gcvPrev <- predict.cv.glmnet(glmnet_fit,newx = W,s = s_prev,type="response")
gcvPrev <- bound(gcvPrev,c(0.025,0.975))

time_ctmlelasso3 <- system.time(
      ctmle_fit3 <- ctmleGlmnet(Y = Y, A = A, W = W, Q = Q,
                                ctmletype=3, g1W = gcv, g1WPrev = gcvPrev,
                                family="gaussian",
                                gbound=0.025, V = 5)
)

## ----eval = TRUE---------------------------------------------------------
time_ctmlelasso1
time_ctmlelasso2
time_ctmlelasso3

## ----eval = TRUE---------------------------------------------------------
ctmle_fit1
ctmle_fit2
ctmle_fit3

## ----eval = TRUE---------------------------------------------------------
lambdas[ctmle_fit1$best_k]

## ----eval = TRUE---------------------------------------------------------
glmnet_fit$lambda.min

## ----eval = TRUE---------------------------------------------------------
lasso_fit <- cv.glmnet(x = as.matrix(W), y = A, alpha = 1, nlambda = 100, nfolds = 10)
lasso_lambdas <- lasso_fit$lambda[lasso_fit$lambda <= lasso_fit$lambda.min][1:5]

# Build SL template for glmnet
SL.glmnet_new <- function(Y, X, newX, family, obsWeights, id, alpha = 1,
                           nlambda = 100, lambda = 0,...){
      # browser()
      if (!is.matrix(X)) {
            X <- model.matrix(~-1 + ., X)
            newX <- model.matrix(~-1 + ., newX)
      }
      fit <- glmnet::glmnet(x = X, y = Y,
                            lambda = lambda,
                            family = family$family, alpha = alpha)
      pred <- predict(fit, newx = newX, type = "response")
      fit <- list(object = fit)
      class(fit) <- "SL.glmnet"
      out <- list(pred = pred, fit = fit)
      return(out)
}

# Use a sequence of estimator to build gn sequence:
SL.cv1lasso <- function (... , alpha = 1, lambda = lasso_lambdas[1]){
      SL.glmnet_new(... , alpha = alpha, lambda = lambda)
}

SL.cv2lasso <- function (... , alpha = 1, lambda = lasso_lambdas[2]){
      SL.glmnet_new(... , alpha = alpha, lambda = lambda)
}

SL.cv3lasso <- function (... , alpha = 1, lambda = lasso_lambdas[3]){
      SL.glmnet_new(... , alpha = alpha, lambda = lambda)
}

SL.cv4lasso <- function (... , alpha = 1, lambda = lasso_lambdas[4]){
      SL.glmnet_new(... , alpha = alpha, lambda = lambda)
}

SL.library = c('SL.cv1lasso', 'SL.cv2lasso', 'SL.cv3lasso', 'SL.cv4lasso', 'SL.glm')

## ------------------------------------------------------------------------
V = 5
folds <-by(sample(1:N,N), rep(1:V, length=N), list)

## ------------------------------------------------------------------------
gn_seq <- build_gn_seq(A = A, W = W, SL.library = SL.library, folds = folds)

## ----eval = TRUE---------------------------------------------------------
gn_seq$gn_candidates %>% dim
gn_seq$gn_candidates_cv %>% dim
gn_seq$folds %>% length

## ----eval = TRUE---------------------------------------------------------
ctmle_general_fit1 <- ctmleGeneral(Y = Y, A = A, W = W, Q = Q,
                                   ctmletype = 1, 
                                   gn_candidates = gn_seq$gn_candidates,
                                   gn_candidates_cv = gn_seq$gn_candidates_cv,
                                   folds = folds, V = 5)

ctmle_general_fit1


