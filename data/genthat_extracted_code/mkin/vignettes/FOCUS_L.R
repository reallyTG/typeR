## ---- include = FALSE----------------------------------------------------
library(knitr)
opts_chunk$set(tidy = FALSE, cache = FALSE)

## ------------------------------------------------------------------------
library("mkin", quietly = TRUE)
FOCUS_2006_L1 = data.frame(
  t = rep(c(0, 1, 2, 3, 5, 7, 14, 21, 30), each = 2),
  parent = c(88.3, 91.4, 85.6, 84.5, 78.9, 77.6,
             72.0, 71.9, 50.3, 59.4, 47.0, 45.1,
             27.7, 27.3, 10.0, 10.4, 2.9, 4.0))
FOCUS_2006_L1_mkin <- mkin_wide_to_long(FOCUS_2006_L1)

## ------------------------------------------------------------------------
m.L1.SFO <- mkinfit("SFO", FOCUS_2006_L1_mkin, quiet = TRUE)
summary(m.L1.SFO)

## ----fig.width = 6, fig.height = 5---------------------------------------
plot(m.L1.SFO, show_errmin = TRUE, main = "FOCUS L1 - SFO")

## ----fig.width = 6, fig.height = 5---------------------------------------
mkinresplot(m.L1.SFO, ylab = "Observed", xlab = "Time")

## ----fig.width = 6, fig.height = 5---------------------------------------
m.L1.FOMC <- mkinfit("FOMC", FOCUS_2006_L1_mkin, quiet=TRUE)
plot(m.L1.FOMC, show_errmin = TRUE, main = "FOCUS L1 - FOMC")
summary(m.L1.FOMC, data = FALSE)

## ------------------------------------------------------------------------
FOCUS_2006_L2 = data.frame(
  t = rep(c(0, 1, 3, 7, 14, 28), each = 2),
  parent = c(96.1, 91.8, 41.4, 38.7,
             19.3, 22.3, 4.6, 4.6,
             2.6, 1.2, 0.3, 0.6))
FOCUS_2006_L2_mkin <- mkin_wide_to_long(FOCUS_2006_L2)

## ----fig.width = 7, fig.height = 6---------------------------------------
m.L2.SFO <- mkinfit("SFO", FOCUS_2006_L2_mkin, quiet=TRUE)
plot(m.L2.SFO, show_residuals = TRUE, show_errmin = TRUE,
     main = "FOCUS L2 - SFO")

## ----fig.width = 7, fig.height = 6---------------------------------------
m.L2.FOMC <- mkinfit("FOMC", FOCUS_2006_L2_mkin, quiet = TRUE)
plot(m.L2.FOMC, show_residuals = TRUE,
     main = "FOCUS L2 - FOMC")
summary(m.L2.FOMC, data = FALSE)

## ----fig.width = 7, fig.height = 6---------------------------------------
m.L2.DFOP <- mkinfit("DFOP", FOCUS_2006_L2_mkin, quiet = TRUE)
plot(m.L2.DFOP, show_residuals = TRUE, show_errmin = TRUE,
     main = "FOCUS L2 - DFOP")
summary(m.L2.DFOP, data = FALSE)

## ------------------------------------------------------------------------
FOCUS_2006_L3 = data.frame(
  t = c(0, 3, 7, 14, 30, 60, 91, 120),
  parent = c(97.8, 60, 51, 43, 35, 22, 15, 12))
FOCUS_2006_L3_mkin <- mkin_wide_to_long(FOCUS_2006_L3)

## ----fig.height = 8------------------------------------------------------
# Only use one core here, not to offend the CRAN checks
mm.L3 <- mmkin(c("SFO", "FOMC", "DFOP"), cores = 1,
               list("FOCUS L3" = FOCUS_2006_L3_mkin), quiet = TRUE)
plot(mm.L3)

## ----fig.height = 5------------------------------------------------------
summary(mm.L3[["DFOP", 1]])
plot(mm.L3[["DFOP", 1]], show_errmin = TRUE)

## ------------------------------------------------------------------------
FOCUS_2006_L4 = data.frame(
  t = c(0, 3, 7, 14, 30, 60, 91, 120),
  parent = c(96.6, 96.3, 94.3, 88.8, 74.9, 59.9, 53.5, 49.0))
FOCUS_2006_L4_mkin <- mkin_wide_to_long(FOCUS_2006_L4)

## ----fig.height = 6------------------------------------------------------
# Only use one core here, not to offend the CRAN checks
mm.L4 <- mmkin(c("SFO", "FOMC"), cores = 1,
               list("FOCUS L4" = FOCUS_2006_L4_mkin),
               quiet = TRUE)
plot(mm.L4)

## ----fig.height = 8------------------------------------------------------
summary(mm.L4[["SFO", 1]], data = FALSE)
summary(mm.L4[["FOMC", 1]], data = FALSE)

