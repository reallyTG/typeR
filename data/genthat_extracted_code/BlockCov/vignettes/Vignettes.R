## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, message=FALSE)
library(BlockCov)
set.seed(516)

## ------------------------------------------------------------------------
q <- 100
Sigma <- Simu_Sigma(q = q, diag = FALSE, equal = TRUE)

## ----fig0, fig.cap="\\label{fig:fig0}",fig.width=3.5,fig.height=3.5,echo=FALSE----
Matrix::image(Sigma)

## ------------------------------------------------------------------------
n <- 30
E <- matrix(rnorm(n * q), ncol = q) %*% chol(as.matrix(Sigma))

## ------------------------------------------------------------------------
k <- 5
nb_nn0 <- sum(Sigma[upper.tri(Sigma, diag = FALSE)] != 0)
res_known <-  Sigma_estimation(E, k = k, nb_nn0 = nb_nn0)

## ----fig1, fig.cap="\\label{fig:fig1}",fig.width=3.5,fig.height=3.5------
Matrix::image(res_known$Sigma_est)

## ----fig2, fig.cap="\\label{fig:fig2}",fig.width=3.5,fig.height=3.5------
Matrix::image(Matrix::Matrix(cor(E)))

## ------------------------------------------------------------------------
res <- Sigma_estimation(E, kmax = 90, prop.max = 0.6, step = 100)

## ----fig3, fig.cap="\\label{fig:fig3}",fig.width=3.5,fig.height=3.5------
Matrix::image(res$Sigma_est)

## ----fig3bis, fig.cap="\\label{fig:fig3bis}",fig.width=3.5,fig.height=3.5----
Matrix::image(res$S_inv_12 %*% Sigma %*% res$S_inv_12)

## ------------------------------------------------------------------------
samp <- sample(1:q, q, replace = FALSE)
Sigma_samp <- Sigma[samp, samp]

## ----fig4, fig.cap="\\label{fig:fig4}",fig.width=3.5,fig.height=3.5------
Matrix::image(Sigma_samp)

## ------------------------------------------------------------------------
E <- matrix(rnorm(n * q), ncol = q) %*% chol(as.matrix(Sigma_samp))
res_samp <- Sigma_estimation(E, prop.max = 0.6, step = 100, reorder = TRUE)

## ----fig5, fig.cap="\\label{fig:fig5}",fig.width=3.5,fig.height=3.5------
Matrix::image(res_samp$Sigma_est)

## ----fig6, fig.cap="\\label{fig:fig6}",fig.width=3.5,fig.height=3.5------
ord <- res_samp$order
Matrix::image(res_samp$Sigma_est[ord, ord])

## ----fig7, fig.cap="\\label{fig:fig7}",fig.width=3.5,fig.height=3.5------
Matrix::image(Sigma_samp[ord, ord])

## ----fig8, fig.cap="\\label{fig:fig8}",fig.width=3.5,fig.height=3.5------
Matrix::image(res_samp$S_inv_12 %*% Sigma_samp %*%res_samp$S_inv_12)

