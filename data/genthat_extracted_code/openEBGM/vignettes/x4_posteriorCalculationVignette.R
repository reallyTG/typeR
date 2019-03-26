## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----hyperparameter estimation, warning = FALSE--------------------------
library(openEBGM)
data(caers)  #subset of publicly available CAERS data

processed <- processRaw(caers, stratify = FALSE, zeroes = FALSE)
squashed <- squashData(processed)
squashed2 <- squashData(squashed, count = 2, bin_size = 10, keep_pts = 50)
theta_init <- data.frame(alpha1 = c(0.2, 0.1, 0.3, 0.5, 0.2),
                         beta1  = c(0.1, 0.1, 0.5, 0.3, 0.2),
                         alpha2 = c(2,   10,  6,   12,  5),
                         beta2  = c(4,   10,  6,   12,  5),
                         p      = c(1/3, 0.2, 0.5, 0.8, 0.4))
hyper_estimates <- autoHyper(squashed2, theta_init = theta_init)
(theta_hat <- hyper_estimates$estimates)

## ------------------------------------------------------------------------
qn <- Qn(theta_hat, N = processed$N, E = processed$E)
head(qn)
identical(length(qn), nrow(processed))
summary(qn)

## ------------------------------------------------------------------------
processed$ebgm <- ebgm(theta_hat, N = processed$N, E = processed$E, qn  = qn)
head(processed)

## ------------------------------------------------------------------------
processed$QUANT_05 <- quantBisect(5, theta_hat = theta_hat,
                                  N = processed$N, E = processed$E, qn = qn)
processed$QUANT_95 <- quantBisect(95, theta_hat = theta_hat,
                                  N = processed$N, E = processed$E, qn = qn)
head(processed)

## ------------------------------------------------------------------------
suspicious <- processed[processed$QUANT_05 >= 2, ]
nrow(suspicious); nrow(processed); nrow(suspicious)/nrow(processed)

## ------------------------------------------------------------------------
suspicious <- suspicious[order(suspicious$QUANT_05, decreasing = TRUE),
                         c("var1", "var2", "N", "E", "QUANT_05", "ebgm", 
                           "QUANT_95")]
head(suspicious, 5)

tabbed <- table(suspicious$var1)
head(tabbed[order(tabbed, decreasing = TRUE)])

