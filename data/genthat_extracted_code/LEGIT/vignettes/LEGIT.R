## ------------------------------------------------------------------------
library(LEGIT)
example_3way(N=5, sigma=1, logit=FALSE, seed=7)

## ----message=FALSE-------------------------------------------------------
train = example_3way(N=250, sigma=1, logit=FALSE, seed=7)
test = example_3way(N=100, sigma=1, logit=FALSE, seed=6)

## ------------------------------------------------------------------------
fit_default = LEGIT(train$data, train$G, train$E, y ~ G*E*z)
summary(fit_default)

## ------------------------------------------------------------------------
ssres = sum((test$data$y - predict(fit_default, test$data, test$G, test$E))^2)
sstotal = sum((test$data$y - mean(test$data$y))^2)
R2 = 1 - ssres/sstotal
R2

## ----fig3, fig.height = 5, fig.width = 5---------------------------------
cov_values = c(3)
names(cov_values) = "z"
plot(fit_default, cov_values = cov_values,cex.leg=1.4, cex.axis=1.5, cex.lab=1.5)

## ------------------------------------------------------------------------
g1_bad = rbinom(250,1,.30)
g2_bad = rbinom(250,1,.30)
g3_bad = rbinom(250,1,.30)
g4_bad = rbinom(250,1,.30)
g5_bad = rbinom(250,1,.30)
train$G = cbind(train$G, g1_bad, g2_bad, g3_bad, g4_bad, g5_bad)

## ------------------------------------------------------------------------
forward_genes_BIC = stepwise_search(train$data, genes_extra=train$G, env_original=train$E, formula=y ~ E*G*z, search_type="forward", search="genes", search_criterion="BIC", interactive_mode=FALSE)

## ------------------------------------------------------------------------
backward_genes_AIC = stepwise_search(train$data, genes_original=train$G, env_original=train$E, formula=y ~ E*G*z, search_type="backward", search="genes", search_criterion="AIC", interactive_mode=FALSE)

## ------------------------------------------------------------------------
forward_genes_BIC = stepwise_search(train$data, genes_extra=train$G, env_original=train$E, formula=y ~ E*G*z, search_type="bidirectional-forward", search="genes", search_criterion="BIC", interactive_mode=TRUE)

## ------------------------------------------------------------------------
forward_genes_BIC = stepwise_search(train$data, genes_original=train$G[,3,drop=FALSE], genes_extra=train$G[,-3], env_original=train$E, formula=y ~ E*G*z, search_type="bidirectional-forward", search="genes", search_criterion="BIC", interactive_mode=TRUE)

## ----message=FALSE-------------------------------------------------------
library(LEGIT)
train = example_2way(N=1000, logit=TRUE, seed=777)

## ------------------------------------------------------------------------
fit_default = LEGIT(train$data, train$G, train$E, y ~ G*E, family=binomial)
summary(fit_default)

## ----fig1, fig.height = 5, fig.width = 5---------------------------------
cv_5folds_bin = LEGIT_cv(train$data, train$G, train$E, y ~ G*E, cv_iter=1, cv_folds=5, classification=TRUE, family=binomial, seed=777)
pROC::plot.roc(cv_5folds_bin$roc_curve[[1]])

## ----fig2, fig.height = 5, fig.width = 5---------------------------------
plot(fit_default, cex.leg=1.4, cex.axis=1.5, cex.lab=1.5)

## ------------------------------------------------------------------------
library(LEGIT)
example_3way_3latent(N=5, sigma=1, logit=FALSE, seed=7)

## ----message=FALSE-------------------------------------------------------
train = example_3way_3latent(N=250, sigma=1, logit=FALSE, seed=7)

## ------------------------------------------------------------------------
fit_default = IMLEGIT(train$data, train$latent_var, y ~ G*E*Z)
summary(fit_default)

## ------------------------------------------------------------------------
g1_bad = rbinom(250,1,.30)
g2_bad = rbinom(250,1,.30)
g3_bad = rbinom(250,1,.30)
g4_bad = rbinom(250,1,.30)
g5_bad = rbinom(250,1,.30)
G_new = cbind(g1_bad, g2_bad, g3_bad, g4_bad, g5_bad)
forward_genes_BIC = stepwise_search_IM(train$data, latent_var_original=train$latent_var, latent_var_extra=list(G=G_new, E=NULL, Z=NULL), formula=y ~ E*G*Z, search_type="forward", search=1, search_criterion="BIC", interactive_mode=FALSE)

