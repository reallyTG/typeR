## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- echo=FALSE, eval=TRUE----------------------------------------------
library(rbin)

## ----manual--------------------------------------------------------------
bins <- rbin_manual(mbank, y, age, c(29, 31, 34, 36, 39, 42, 46, 51, 56))
bins

## ----manual_plot, fig.width=7, fig.height=5, fig.align='center'----------
# plot
plot(bins)

## ----manual_dummy--------------------------------------------------------
bins <- rbin_manual(mbank, y, age, c(29, 31, 34, 36, 39, 42, 46, 51, 56))
rbin_create(mbank, age, bins)

## ----factor_combine------------------------------------------------------
upper <- c("secondary", "tertiary")
out <- rbin_factor_combine(mbank, education, upper, "upper")
table(out$education)

out <- rbin_factor_combine(mbank, education, c("secondary", "tertiary"), "upper")
table(out$education)

## ----factor_bins---------------------------------------------------------
bins <- rbin_factor(mbank, y, education)
bins

## ----factor_plot, fig.width=7, fig.height=5, fig.align='center'----------
# plot
plot(bins)

## ----factor_create-------------------------------------------------------
upper <- c("secondary", "tertiary")
out <- rbin_factor_combine(mbank, education, upper, "upper")
rbin_factor_create(out, education)

## ----quantile------------------------------------------------------------
bins <- rbin_quantiles(mbank, y, age, 10)
bins

## ----quantile_plot, fig.width=7, fig.height=5, fig.align='center'--------
# plot
plot(bins)

## ----equal_length--------------------------------------------------------
bins <- rbin_equal_length(mbank, y, age, 10)
bins

## ----equal_length_plot, fig.width=7, fig.height=5, fig.align='center'----
# plot
plot(bins)

## ----winsorize-----------------------------------------------------------
bins <- rbin_winsorize(mbank, y, age, 10, winsor_rate = 0.05)
bins

## ----winsorize_plot, fig.width=7, fig.height=5, fig.align='center'-------
# plot
plot(bins)

