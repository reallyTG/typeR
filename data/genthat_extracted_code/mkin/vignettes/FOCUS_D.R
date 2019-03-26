## ---- include = FALSE----------------------------------------------------
library(knitr)
opts_chunk$set(tidy = FALSE, cache = TRUE)

## ----data----------------------------------------------------------------
library("mkin", quietly = TRUE)
print(FOCUS_2006_D)

## ----model---------------------------------------------------------------
SFO_SFO <- mkinmod(parent = mkinsub("SFO", "m1"), m1 = mkinsub("SFO"))
print(SFO_SFO$diffs)

## ----fit-----------------------------------------------------------------
fit <- mkinfit(SFO_SFO, FOCUS_2006_D, quiet = TRUE)

## ----plot, fig.height = 6, fig.width = 8---------------------------------
plot_sep(fit, lpos = c("topright", "bottomright"))

## ----plot_2, fig.height = 4, fig.width = 8-------------------------------
mkinparplot(fit)

## ------------------------------------------------------------------------
summary(fit)

