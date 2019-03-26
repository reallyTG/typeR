## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----dataSquash example--------------------------------------------------
library(openEBGM)
data(caers)

processed <- processRaw(caers)
processed[1:4, 1:4]

squashed <- squashData(processed) #Using defaults
head(squashed)

nrow(processed)
nrow(squashed)

## ----iterative squashing example-----------------------------------------
squash1 <- squashData(processed)
squash2 <- squashData(squash1, count = 2, bin_size = 8)

## ----autoSquash example--------------------------------------------------
squash3 <- autoSquash(processed)
ftable(squash3[, c("N", "weight")])

## ----negLLsquash example, warning = FALSE--------------------------------
theta_init <- c(alpha1 = 0.2, beta1 = 0.1, alpha2 = 2, beta2 = 4, p = 1/3)
stats::nlm(negLLsquash, p = theta_init,
           ni = squashed$N, ei = squashed$E, wi = squashed$weight, N_star = 1)

## ------------------------------------------------------------------------
theta_init <- data.frame(alpha1 = c(0.2, 0.1, 0.3),
                         beta1  = c(0.1, 0.2, 0.5),
                         alpha2 = c(2,   10,  6),
                         beta2  = c(4,   10,  6),
                         p      = c(1/3, 0.2, 0.5)
                         )

## ----autoHyper example, warning = FALSE----------------------------------
system.time(
hyper_estimates_full <- autoHyper(data = processed, theta_init = theta_init, 
                                  squashed = FALSE)
)

squashed2 <- squashData(squashed, count = 2, bin_size = 10, keep_pts = 50)
system.time(
hyper_estimates_squashed <- autoHyper(data = squashed2, theta_init = theta_init)
)

hyper_estimates_full

hyper_estimates_squashed

## ----autoHyper example with CIs, warning = FALSE-------------------------
autoHyper(squashed2, theta_init = theta_init, conf_ints = TRUE)$conf_int

## ----hyperparameter estimation example, warning = FALSE------------------
exploreHypers(data = squashed2, theta_init = theta_init, std_errors = TRUE)

## ----hyperEM example, warning = FALSE------------------------------------
data(caers)
proc <- processRaw(caers)
squashed <- squashData(proc, bin_size = 100, keep_pts = 0)
squashed <- squashData(squashed, count = 2, bin_size = 12)
hyperEM_ests <- hyperEM(squashed, theta_init_vec = c(1, 1, 2, 2, .3),
                        conf_int = TRUE, track = TRUE)
str(hyperEM_ests)

## ----hyperEM plotting example, warning = FALSE, fig.width = 7, fig.height = 10----
library(ggplot2)
library(tidyr)
pdat <- gather(hyperEM_ests$tracking, key = "metric", value = "value", logL:P)
pdat$metric <- factor(pdat$metric, levels = unique(pdat$metric), ordered = TRUE)
ggplot(pdat, aes(x = iter, y = value)) +
  geom_line(size = 1.1, col = "blue") +
  facet_grid(metric ~ ., scales = "free") +
  ggtitle("Convergence Assessment",
          sub = "Dashed red line indicates accelerated estimate") +
  labs(x = "Iteration Count", y = "Estimate") +
  geom_vline(xintercept = c(100, 200), size = 1, linetype = 2, col = "red")

