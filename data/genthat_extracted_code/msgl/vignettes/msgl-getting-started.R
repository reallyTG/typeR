## ---- echo = FALSE-------------------------------------------------------
set.seed(150)

## ----results="hide"------------------------------------------------------
library(msgl)

## ----eval = FALSE--------------------------------------------------------
#  x <- # load design matrix (of size N x p)
#  classes <- # load class labels (a vector of size N)

## ------------------------------------------------------------------------
data(PrimaryCancers)
x[1:5,1:5]
dim(x)
table(classes)

## ------------------------------------------------------------------------
idx <- 1:10
x.test <- x[idx,]
x <- x[-idx,]
classes.test <- classes[idx]
classes <- classes[-idx]

## ------------------------------------------------------------------------
cl <- makeCluster(2)
registerDoParallel(cl)

fit.cv <- msgl::cv(x, classes, fold = 10, alpha = 0.5, lambda = 0.1, use_parallel = TRUE)

stopCluster(cl)

## ------------------------------------------------------------------------
fit.cv

## ------------------------------------------------------------------------
fit <- msgl::fit(x, classes, alpha = 0.5, lambda = 0.1)

## ------------------------------------------------------------------------
fit

## ------------------------------------------------------------------------
features(fit)[[best_model(fit.cv)]] # Non-zero features in best model

## ------------------------------------------------------------------------
parameters(fit)[[best_model(fit.cv)]]

## ------------------------------------------------------------------------
coef(fit, best_model(fit.cv))[,1:5] # First 5 non-zero parameters of best model

## ---- eval=FALSE---------------------------------------------------------
#  x.test <- # load matrix with test data (of size M x p)

## ------------------------------------------------------------------------
res <- predict(fit, x.test)

res$classes[,best_model(fit.cv)] # Classes predicted by best model
classes.test # True classes

## ------------------------------------------------------------------------
res$response[[best_model(fit.cv)]]

