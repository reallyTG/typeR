library(LVGP)


### Name: LVGP_fit
### Title: The Fitting Function of 'LVGP' Package
### Aliases: LVGP_fit

### ** Examples

# Math example with 2 quantitative and 1 qualitative variables (dataset included in the package):
#     Fit a model (with default settings) and evaluate the performance
#     by computing the root mean squared error (RMSE) in prediction.
#     Also, plot the latent variable parameters.
X_tr <- math_example$X_tr
Y_tr <- math_example$Y_tr
X_te <- math_example$X_te
Y_te <- math_example$Y_te
n_te <- nrow(X_te)
model <- LVGP_fit(X_tr, Y_tr, ind_qual = c(3))
output <- LVGP_predict(X_te, model)
Y_hat <- output$Y_hat
RRMSE <- sqrt(sum((Y_hat-Y_te)^2)/n_te)/(max(Y_te)-min(Y_te))
LVGP_plot(model)




