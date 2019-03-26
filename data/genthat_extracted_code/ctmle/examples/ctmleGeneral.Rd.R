library(ctmle)


### Name: ctmleGeneral
### Title: General Template for Collaborative Targeted Maximum Likelihood
###   Estimation
### Aliases: ctmleGeneral

### ** Examples

N <- 1000
p = 100
V = 5
Wmat <- matrix(rnorm(N * p), ncol = p)
gcoef <- matrix(c(-1,-1,rep(-(3/((p)-2)),(p)-2)),ncol=1)

W <- as.data.frame(Wmat)
g <- 1/(1+exp(Wmat%*%gcoef / 3))
A <- rbinom(N, 1, prob = g)

# Build potential outcome pairs, and the observed outcome Y
beta1 <- 4+2*Wmat[,1]+2*Wmat[,2]+2*Wmat[,5]+2*Wmat[,6]+2*Wmat[,8]
beta0 <- 2+2*Wmat[,1]+2*Wmat[,2]+2*Wmat[,5]+2*Wmat[,6]+2*Wmat[,8]

tau = 2
sigma <- 1
epsilon <-rnorm(N,0,sigma)
Y  <- beta0 + tau * A + epsilon
# Initial estimate of Q
Q <- cbind(rep(mean(Y[A == 1]), N), rep(mean(Y[A == 0]), N))

folds <-by(sample(1:N,N), rep(1:V, length=N), list)

lasso_fit <- cv.glmnet(x = as.matrix(W), y = A, alpha = 1, nlambda = 100, nfolds = 10)
lasso_lambdas <- lasso_fit$lambda[lasso_fit$lambda <= lasso_fit$lambda.min][1:5]
# Build template for glmnet
SL.glmnet_new <- function (Y, X, newX, family, obsWeights, id, alpha = 1,
                          nlambda = 100, lambda = 0,...)
{
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

# Use a sequence of LASSO estimators to build gn sequence:
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

# Build the sequence. See more details in the function build_gn_seq, and package SuperLearner
gn_seq <- build_gn_seq(A = A, W = W, SL.library = SL.library, folds = folds)


# Use the output of build_gn_seq for ctmle general templates
ctmle_fit <- ctmleGeneral(Y = Y, A = A, W = W, Q = Q, ctmletype = 1,
                     gn_candidates = gn_seq$gn_candidates,
                     gn_candidates_cv = gn_seq$gn_candidates_cv,
                     folds = gn_seq$folds, V = length(folds))



