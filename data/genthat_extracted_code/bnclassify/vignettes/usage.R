## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(cache = FALSE, autodep = TRUE, collapse = TRUE, comment = "#>"
                      # , fig.height = 3, fig.width = 3
                      )

## ------------------------------------------------------------------------
library(bnclassify)
data(car)
dim(car)
head(car)

## ------------------------------------------------------------------------
nb <- nb('class', car) # Learn a naive Bayes structure 
nb <- lp(nb, car, smooth = 1) # Learn parameters
cv(nb, car, k = 10) # 10-fold Cross-validation estimate of accuracy
head(predict(nb, car)) # Classify the entire data set

## ----learn_ode-----------------------------------------------------------
# Naive Bayes
nb <- nb('class', car)
# ODE Chow-Liu with AIC score (penalized log-likelihood)
ode_cl_aic <- tan_cl('class', car, score = 'aic')
# Semi-naive Bayes with forward sequential selection and joining (FSSJ) and 
# 5-fold cross-validation
fssj <- fssj('class', car, k = 5, epsilon = 0)  

## ------------------------------------------------------------------------
ode_cl_aic 

## ---- fig.height=4-------------------------------------------------------
plot(ode_cl_aic)

## ---- fig.height=4-------------------------------------------------------
plot(ode_cl_aic, layoutType = 'twopi', fontsize = 15)

## ------------------------------------------------------------------------
families(ode_cl_aic)

## ------------------------------------------------------------------------
narcs(nb)

## ------------------------------------------------------------------------
is_ode(ode_cl_aic)
is_semi_naive(ode_cl_aic)

## ------------------------------------------------------------------------
nb <- lp(nb, car, smooth = 0.01)

## ------------------------------------------------------------------------
awnb <- lp(nb, car, smooth = 0.01, awnb_trees = 10, awnb_bootstrap = 0.5)
manb <- lp(nb, car, smooth = 0.01, manb_prior = 0.5)

## ------------------------------------------------------------------------
ode_cl_aic <- bnc('tan_cl', 'class', car, smooth = 1, dag_args = list(score = 'aic'))

## ------------------------------------------------------------------------
ode_cl_aic

## ------------------------------------------------------------------------
params(nb)$buying

## ---- eval = FALSE, results = "hide", echo = FALSE-----------------------
#  params(awnb)$buying
#  params(manb)$buying

## ------------------------------------------------------------------------
nparams(nb)

## ------------------------------------------------------------------------
a <- lp(nb('class', car), car, smooth = 1)
g <- as_grain(a)
gRain::querygrain.grain(g)$buying

## ------------------------------------------------------------------------
length(features(fssj))
set.seed(0)
bsej <- bsej('class', car, k = 5, epsilon = 0)  
length(features(bsej))

## ------------------------------------------------------------------------
manb_arc_posterior(manb)

## ------------------------------------------------------------------------
params(manb)$doors 

## ------------------------------------------------------------------------
all.equal(params(manb)$buying, params(nb)$buying)

## ------------------------------------------------------------------------
awnb_weights(awnb)

## ------------------------------------------------------------------------
logLik(ode_cl_aic, car)
AIC(ode_cl_aic, car)
BIC(ode_cl_aic, car)

## ------------------------------------------------------------------------
p <- predict(nb, car)
accuracy(p, car$class)

## ------------------------------------------------------------------------
set.seed(0)
cv(ode_cl_aic, car, k = 10)

## ------------------------------------------------------------------------
set.seed(0)
cv(ode_cl_aic, car, k = 10, dag = FALSE)

## ------------------------------------------------------------------------
set.seed(0)
cv(ode_cl_aic, car, k = 10, dag = FALSE, mean = FALSE)

## ------------------------------------------------------------------------
set.seed(0)
accu <- cv(list(nb = nb, ode_cl_aic = ode_cl_aic), car, k = 5, dag = TRUE)
accu

## ------------------------------------------------------------------------
p <- predict(nb, car)
# We use head() to print the first elements of vector p
head(p)

## ------------------------------------------------------------------------
pp <- predict(nb, car, prob = TRUE)
head(pp)

## ------------------------------------------------------------------------
cmi('maint', 'buying', car)

## ------------------------------------------------------------------------
cmi('maint', 'buying', car, 'class')

## ---- eval = FALSE-------------------------------------------------------
#  library(mlr)
#  ode_cl_aic_mlr <- as_mlr(ode_cl_aic, dag = TRUE, id = "ode_cl_aic")

## ---- eval = FALSE-------------------------------------------------------
#  # 5-fold cross-validation
#  rdesc = makeResampleDesc("CV", iters = 2)
#  # sequential floating forward search
#  ctrl = makeFeatSelControlSequential(method = "sfs", alpha = 0)
#  # Wrap ode_cl_aic_mlr with feature selection
#  ode_cl_aic_mlr_fs = makeFeatSelWrapper(ode_cl_aic_mlr, resampling = rdesc,
#                                        control = ctrl, show.info = FALSE)
#  t <- makeClassifTask(id = "car", data = car,
#          target = 'class', fixup.data = "no", check.data = FALSE)

## ----wrapper_fss, eval = FALSE-------------------------------------------
#  set.seed(0)
#  # Select features
#  mod <- train(ode_cl_aic_mlr_fs, task = t)
#  sfeats <- getFeatSelResult(mod)
#  sfeats

## ---- eval = FALSE-------------------------------------------------------
#  set.seed(0)
#  r = resample(learner = ode_cl_aic_mlr_fs, task = t,
#               resampling = rdesc, show.info = FALSE, measure = mlr::acc)

## ---- eval = FALSE, echo = FALSE-----------------------------------------
#  ode_cl_aic_mlr_prob <- setPredictType(ode_cl_aic_mlr, "prob")
#  set.seed(0)
#  benchmark(ode_cl_aic_mlr_prob, t, rdesc, show.info = FALSE,
#            measures = mlr::multiclass.auc)

## ---- eval = FALSE-------------------------------------------------------
#  rf <- makeLearner("classif.randomForest", id = "rf")
#  classifiers <- list(ode_cl_aic_mlr, rf)
#  set.seed(0)
#  benchmark(classifiers, t, rdesc, show.info = FALSE, measures = mlr::acc)

