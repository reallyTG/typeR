## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, warning=FALSE, message=FALSE, fig.width = 6, fig.height = 4, cache = FALSE)

## ---- include=FALSE------------------------------------------------------
library("bookdown")

## ------------------------------------------------------------------------
library("SimCorrMix")
L <- calc_theory("Logistic", c(0, 1))
C <- calc_theory("Chisq", 4)
B <- calc_theory("Beta", c(4, 1.5))
mix_pis <- list(c(0.4, 0.6), c(0.3, 0.2, 0.5))
mix_mus <- list(c(-2, 2), c(L[1], C[1], B[1]))
mix_sigmas <- list(c(1, 1), c(L[2], C[2], B[2]))
p_M11M21 <- p_M11M22 <- p_M11M23 <- 0.35
p_M12M21 <- p_M12M22 <- p_M12M23 <- 0.35
p_M1M2 <- matrix(c(p_M11M21, p_M11M22, p_M11M23, p_M12M21, p_M12M22, p_M12M23), 
  2, 3, byrow = TRUE)
rhoM1M2 <- rho_M1M2(mix_pis, mix_mus, mix_sigmas, p_M1M2)

## ------------------------------------------------------------------------
p_M11C1 <- p_M12C1 <- 0.35
p_M1C1 <- c(p_M11C1, p_M12C1)
rho_M1C1 <- rho_M1Y(mix_pis[[1]], mix_mus[[1]], mix_sigmas[[1]], p_M1C1)

## ------------------------------------------------------------------------
p_M21C1 <- p_M22C1 <- p_M23C1 <- 0.35
p_M2C1 <- c(p_M21C1, p_M22C1, p_M23C1)
rho_M2C1 <- rho_M1Y(mix_pis[[2]], mix_mus[[2]], mix_sigmas[[2]], p_M2C1)

