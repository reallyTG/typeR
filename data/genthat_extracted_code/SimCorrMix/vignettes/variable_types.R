## ----setup, echo = FALSE-------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, message = FALSE, warning = FALSE, fig.align = 'center', fig.width = 4.65, fig.height = 4)

## ---- include=FALSE------------------------------------------------------
library("bookdown")

## ---- fig.show='hold', fig.cap = "Contaminated normal distribution Y", include=FALSE, eval=FALSE----
#  #Setting $\pi = 0.3$ and $\sigma^2 = 1$ produces the following distribution for $n = 10000$:
#  library("SimCorrMix")
#  Nstcum <- calc_mixmoments(mix_pis = c(0.3, 0.7), mix_mus = c(0, 0),
#    mix_sigmas = c(3, 1), mix_skews = c(0, 0), mix_skurts = c(0, 0),
#    mix_fifths = c(0, 0), mix_sixths = c(0, 0))
#  Nmix <- contmixvar1(n = 10000, "Polynomial", Nstcum[1], Nstcum[2]^2,
#    mix_pis = c(0.3, 0.7), mix_mus = c(0, 0), mix_sigmas = c(3, 1),
#    mix_skews = c(0, 0), mix_skurts = c(0, 0), mix_fifths = c(0, 0),
#    mix_sixths = c(0, 0))
#  plot_simpdf_theory(sim_y = Nmix$Y_mix[, 1], overlay = FALSE,
#    legend.position = "none", title = "PDF of Y")
#  qqnorm(Nmix$Y_mix[, 1], main = "Q-Q plot for Y")
#  qqline(Nmix$Y_mix[, 1], col = 2)
#  #The Q-Q plot shows that the assumption of homogeneous variance for the error distribution would not be valid in this situation

