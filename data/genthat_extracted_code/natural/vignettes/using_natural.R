## ------------------------------------------------------------------------
library(natural)
set.seed(123)
nsim <- 100
sim <- make_sparse_model(n = 50, p = 300, alpha = 0.6, rho = 0.6, snr = 2, nsim = nsim)

## ---- fig.height = 5, fig.width = 5, fig.align='center'------------------
nl <- nlasso_path(x = sim$x, y = sim$y[, 1])
#plot(nl)
#print(nl)

## ---- fig.height = 5, fig.width = 5, fig.align='center'------------------
nl_cv <- nlasso_cv(x = sim$x, y = sim$y[, 1])
plot(nl_cv)

## ---- fig.height = 5, fig.width = 5, fig.align='center'------------------
library(glmnet)
g_o <- glmnet(x = sim$x, y = sim$y[, 1], lambda = nl$lambda)
nl2 <- nlasso_path(x = sim$x, y = sim$y[, 1], glmnet_output = g_o)

## ---- fig.height = 5, fig.width = 5, fig.align='center'------------------
g_o_cv <- cv.glmnet(x = sim$x, y = sim$y[, 1])
nl_cv2 <- nlasso_cv(x = sim$x, y = sim$y[, 1], glmnet_output = g_o_cv)

## ---- fig.height = 7, fig.width = 7, fig.align='center'------------------
err_o_mat <- matrix(NA, nrow = nsim, ncol = 6)
colnames(err_o_mat) <- c("olasso(1)", "olasso(2)", "olasso(cv)", "nlasso", "naive", "df")
for(i in seq(nsim)){
  cur_ol <- olasso(x = sim$x, y = sim$y[, i])
  err_o_mat[i, 1] <- (cur_ol$sig_obj_1 / sim$sigma - 1)^2
  err_o_mat[i, 2] <- (cur_ol$sig_obj_2 / sim$sigma - 1)^2
  cur_ol_cv <- olasso_cv(x = sim$x, y = sim$y[, i])
  err_o_mat[i, 3] <- (cur_ol_cv$sig_obj / sim$sigma - 1)^2
  cur_nl_cv <- nlasso_cv(x = sim$x, y = sim$y[, i])
  err_o_mat[i, 4] <- (cur_nl_cv$sig_obj / sim$sigma - 1)^2
  err_o_mat[i, 5] <- (cur_nl_cv$sig_naive / sim$sigma - 1)^2
  err_o_mat[i, 6] <- (cur_nl_cv$sig_df / sim$sigma - 1)^2
}
boxplot(err_o_mat, ylim = c(0, 0.4), ylab = "Mean squared error")

