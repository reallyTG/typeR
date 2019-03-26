## ----setup, include=FALSE, cache=FALSE--------------------------------------------------
library(knitr)
# set global chunk options
opts_chunk$set(fig.align='center')
options(formatR.arrow=TRUE,width=90)

## ---------------------------------------------------------------------------------------
library(EMVS)

## ---------------------------------------------------------------------------------------
set.seed(12022018)
n = 100
p = 1000
X = matrix(rnorm(n * p), n, p)
beta = c(1.5, 2, 2.5, rep(0,p-3))
Y = X[,1] * beta[1] + X[,2] * beta[2] + X[,3] * beta[3] + rnorm(n)

## ----results = "hide"-------------------------------------------------------------------
# independent prior on regression coefficients and variance
v0 = exp(seq(-10, -1, length.out = 20))
v1 = 1
beta_init = rep(1, p)
sigma_init = 1
a = b = 1

## ----results = "hide"-------------------------------------------------------------------
# independent prior on regression coefficients and variance
result_ind = EMVS(Y = Y, X = X, v0 = v0, v1 = v1, type = "betabinomial", 
                  independent = TRUE, beta_init = beta_init, 
                  sigma_init = sigma_init,
                  a = a, b = b, log_v0 = TRUE)

## ----fig.width = 2.75, fig.height = 3 , dev.args = list(pointsize =8)-------------------
EMVSplot(result_ind, "both", FALSE)

## ----results = "hide"-------------------------------------------------------------------
v0 = seq(0.1, 2, length.out = 20)
v1 = 1000
result_conj = EMVS(Y, X, v0 = v0, v1 = v1, type = "betabinomial", 
                   independent = FALSE, beta_init = beta_init, 
                   sigma_init = sigma_init, a = a, b = b)

## ---------------------------------------------------------------------------------------
EMVSbest(result_conj)

## ----fig.width = 5.5, fig.height= 3, dev.args = list(pointsize =8)----------------------
EMVSplot(result_conj, "both", FALSE)

## ----echo = F, warning = F, fig.width = 5.5, fig.height = 6, dev.args = list(pointsize =8)----
par(mfrow = c(2, 2))

# independent regularization plot
select <- apply(result_ind$prob_inclusion, 2, function(x){as.numeric(x > 0.5)})
matplot(log(result_ind$v0), result_ind$betas, xlab = expression(log(v[0])), ylab = expression(hat(beta)), lwd = 1, col = "grey", lty = 2, type = "l")
matpoints(log(result_ind$v0), result_ind$betas * select, xlab = expression(log(v[0])), ylab = expression(hat(beta)), lwd = 1, col = 4, lty = 2, pch = 19)
matpoints(log(result_ind$v0), result_ind$betas*(1-select), xlab = expression(log(v[0])), ylab = expression(hat(beta)), lwd = 1, col = 2, lty = 2, pch = 19)
par(xpd = T)
labels = paste("X", 1:ncol(result_ind$betas), sep = "")
labels[select[length(result_ind$v0), ] == 0] <-""
text(max(log(result_ind$v0)) + 0.75, result_ind$betas[length(result_ind$v0), ], labels = labels, col = 4)
title("Regularization Plot (Independent)")

# independent sigma estimates
plot(log(result_ind$v0), result_ind$sigmas, xlab = expression(log(v[0])), ylab = expression(hat(sigma)), lwd = 1, col = "grey", lty = 2, type = "l", ylim = c(0, 1.1))
points(log(result_ind$v0), result_ind$sigmas, xlab = expression(log(v[0])), ylab = expression(hat(sigma)), lwd = 1, lty = 2, pch = 19)
par(xpd = F)
abline(h = 1, col = "red")
title(expression(paste(bold(hat(sigma)), bold(" (Independent)"))))
ind_sig_max = round(max(result_ind$sigmas), 4)


# conjugate regularization plot
select <- apply(result_conj$prob_inclusion, 2, function(x){as.numeric(x > 0.5)})
matplot(result_conj$v0, result_conj$betas, xlab = expression(v[0]), ylab = expression(hat(beta)), lwd = 1, col = "grey", lty = 2, type = "l")
matpoints(result_conj$v0, result_conj$betas * select, xlab = expression(v[0]), ylab = expression(hat(beta)), lwd = 1, col = 4, lty = 2, pch = 19)
matpoints(result_conj$v0, result_conj$betas*(1-select), xlab = expression(v[0]), ylab = expression(hat(beta)), lwd = 1, col = 2, lty = 2, pch = 19)
par(xpd = T)
labels = paste("X", 1:ncol(result_conj$betas), sep = "")
labels[select[length(result_conj$v0), ] == 0] <-""
text(max(result_conj$v0) * (1.1), result_conj$betas[length(result_conj$v0), ], labels = labels, col = 4)
title("Regularization Plot (Conjugate)")

# conjugate sigma estimates
plot(result_conj$v0, result_conj$sigmas, xlab = expression(v[0]), ylab = expression(hat(sigma)), lwd = 1, col = "grey", lty = 2, type = "l")
points(result_conj$v0, result_conj$sigmas, xlab = expression(v[0]), ylab = expression(hat(sigma)), lwd = 1, lty = 2, pch = 19)
par(xpd = F)
abline(h = 1, col = "red")
title(expression(paste(bold(hat(sigma)), bold(" (Conjugate)"))))
conj_sig_max = round(max(result_conj$sigmas), 4)


