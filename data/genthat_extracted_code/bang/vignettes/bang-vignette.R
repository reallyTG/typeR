## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(comment = "#>", collapse = TRUE)
set.seed(47)

## ---- fig.align = 'center', fig.width = 7, fig.height = 7----------------
library(bang)
# To produce a plot akin to Figure 5.3 of Gelman et al. (2014) we
# (a) Use the same prior for (alpha, beta)
# (b) Don't use axis rotation (rotate = FALSE)
# (c) Plot on the scale used for ratio-of-uniforms sampling (ru_scale = TRUE)
# (d) Note that the mode is relocated to (0, 0) in the plot
rat_res <- hef(model = "beta_binom", data = rat, rotate = FALSE, n = 10000)
# Plot of simulated values and posterior density contours
plot(rat_res, ru_scale = TRUE)
# The estimated posterior mode, which agrees with Figure 5.3 of Gelman et al. (2014)
rat_res$f_mode

