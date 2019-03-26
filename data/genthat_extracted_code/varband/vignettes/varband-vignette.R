## ------------------------------------------------------------------------
library(varband)
set.seed(123)
p <- 50
n <- 100
true <- varband_gen(p = p, block = 5)

## ------------------------------------------------------------------------
# random sample
x <- sample_gen(L = true, n = n)
# sample covariance matrix
S <- crossprod(scale(x, center = TRUE, scale = FALSE)) / n

## ---- fig.height = 4, fig.width = 7--------------------------------------
par(mfrow = c(1, 2), mar = c(0, 0, 2, 0))
matimage(true, main = "True L")
matimage(S, main = "Sample covariance matrix")

## ---- fig.height = 4, fig.width = 7, fig.align='center'------------------
# use identity matrix as initial estimate
init <- diag(p)
L_weighted <- varband(S = S, lambda = 0.4, init = init, w = TRUE)
L_unweighted <- varband(S = S, lambda = 0.4, init = init, w = FALSE)
par(mfrow = c(1,2), mar = c(0, 0, 2, 0))
matimage(L_weighted, main = "weighted, lam = 0.4")
matimage(L_unweighted, main = "unweighted, lam = 0.4")

## ---- fig.height = 12.6, fig.width = 7, fig.align='center'---------------
# generate a grid of 40 tuning paramters,
# with the ratio of smallest value and largest value equals to 0.03
res <- varband_path(S = S, w = FALSE, nlam = 40, flmin = 0.03)
par(mfrow = c(8, 5), mar = 0.1 + c(0, 0, 2, 0))
for (i in seq_along(res$lamlist))
  matimage(res$path[, , i], main = sprintf("lam=%s", round(res$lamlist[i], 4)))

## ---- fig.height = 5, fig.width = 5, fig.align='center'------------------
res_cv <- varband_cv(x = x, w = FALSE, nlam = 40, flmin = 0.03)
m <- rowMeans(res_cv$errs_fit)
se <- apply(res_cv$errs_fit, 1, sd) / sqrt(length(res_cv$folds))
plot(res_cv$lamlist, m, 
     main = "negative Gaussian log-likelihood",
     xlab = "tuning parameter", ylab = "average neg-log-likelihood",
     type="o", ylim = range(m - se, m + se), pch = 20)
# 1-se rule
lines(res_cv$lamlist, m + se)
lines(res_cv$lamlist, m - se)
abline(v = res_cv$lamlist[res_cv$ibest_fit], lty = 2)
abline(v = res_cv$lamlist[res_cv$i1se_fit], lty = 2)

## ---- fig.height = 4, fig.width = 7--------------------------------------
par(mfrow = c(1,2), mar = c(0, 0, 2, 0))
matimage(res_cv$L_fit, main = "Fit")
matimage(res_cv$L_refit, main = "Refit")

