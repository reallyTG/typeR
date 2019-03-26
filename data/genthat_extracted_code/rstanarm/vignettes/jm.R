params <-
list(EVAL = FALSE)

## ---- SETTINGS-knitr, include=FALSE--------------------------------------
stopifnot(require(knitr))
opts_chunk$set(
  comment=NA, 
  message = FALSE, 
  warning = FALSE, 
  eval = params$EVAL,
  dev = "png",
  dpi = 150,
  fig.asp = 0.618,
  fig.width = 5,
  out.width = "60%",
  fig.align = "center"
)

## ----setup_jm, include=FALSE, message=FALSE------------------------------
#  knitr::opts_chunk$set(fig.width=10, fig.height=4)
#  library(rstanarm)

## ----traj_figure, echo=FALSE---------------------------------------------
#  # Plot observed longitudinal trajectories for log serum bilirubin
#  ids <- c(25,31:33,36,38:40)
#  pbcLong_subset <- pbcLong[pbcLong$id %in% ids, ]
#  pbcLong_subset <- merge(pbcLong_subset, pbcSurv)
#  pbcLong_subset$Died <- factor(pbcLong_subset$death,
#                                labels = c("No", "Yes"))
#  patient_labels <- paste("Patient", 1:8)
#  names(patient_labels) <- ids
#  ggplot() +
#    geom_line(aes(y = logBili, x = year, lty = Died),
#              data = pbcLong_subset) +
#    facet_wrap(~ id, ncol = 4, labeller = labeller(id = patient_labels)) +
#    theme_bw() +
#    ylab("Log serum bilirubin") +
#    xlab("Time (years)")

## ----pbcLong-------------------------------------------------------------
#  head(pbcLong)

## ----pbcSurv-------------------------------------------------------------
#  head(pbcSurv)

## ----datasets_help, eval = FALSE-----------------------------------------
#  help("datasets", package = "rstanarm")

## ----univariate_fit, results = "hold", message = FALSE, warning = FALSE----
#  library(rstanarm)
#  mod1 <- stan_jm(formulaLong = logBili ~ sex + trt + year + (year | id),
#                  dataLong = pbcLong,
#                  formulaEvent = survival::Surv(futimeYears, death) ~ sex + trt,
#                  dataEvent = pbcSurv,
#                  time_var = "year",
#                  chains = 1, refresh = 2000, seed = 12345)

## ----print, echo = FALSE-------------------------------------------------
#  print(mod1)

## ----summary-------------------------------------------------------------
#  summary(mod1, probs = c(.025,.975))

## ----VarCorr-------------------------------------------------------------
#  as.data.frame(VarCorr(mod1))

## ----assoc_etaslope, eval = FALSE----------------------------------------
#  mod2 <- stan_jm(formulaLong = logBili ~ sex + trt + year + (year | id),
#                  dataLong = pbcLong,
#                  formulaEvent = survival::Surv(futimeYears, death) ~ sex + trt,
#                  dataEvent = pbcSurv,
#                  assoc = c("etavalue", "etaslope"),
#                  time_var = "year",
#                  chains = 1, refresh = 2000, seed = 12345)

## ----fitmodel_mv_ev_ev, warning=FALSE, message=FALSE---------------------
#  mod3 <- stan_jm(
#      formulaLong = list(
#          logBili ~ sex + trt + year + (year | id),
#          albumin ~ sex + trt + year + (year | id)),
#      formulaEvent = survival::Surv(futimeYears, death) ~ sex + trt,
#      dataLong = pbcLong, dataEvent = pbcSurv,
#      time_var = "year",
#      chains = 1, refresh = 2000, seed = 12345)

## ----results_print-------------------------------------------------------
#  print(mod3)

## ----results_summary-----------------------------------------------------
#  summary(mod3, pars = "assoc")

## ----plots_872312--------------------------------------------------------
#  p1 <- posterior_traj(mod3, m = 1, ids = 6:8)
#  pp1 <- plot(p1, plot_observed = TRUE)
#  pp1

## ----plots_555762--------------------------------------------------------
#  p2 <- posterior_traj(mod3, m = 2, ids = 6:8)
#  pp2 <- plot(p2, plot_observed = TRUE)
#  pp2

## ----plots_65662---------------------------------------------------------
#  p3 <- posterior_traj(mod3, m = 1, ids = 6:8, extrapolate = TRUE)
#  pp3 <- plot(p3, plot_observed = TRUE, vline = TRUE)
#  pp3

## ----plots_998889--------------------------------------------------------
#  p4 <- posterior_traj(mod3, m = 2, ids = 6:8, extrapolate = TRUE)
#  pp4 <- plot(p4, plot_observed = TRUE, vline = TRUE)
#  pp4

## ----plots_23812---------------------------------------------------------
#  p5 <- posterior_survfit(mod3, ids = 6:8)
#  pp5 <- plot(p5)
#  pp5

## ----plots_987321, fig.height=13-----------------------------------------
#  plot_stack_jm(yplot = list(pp3, pp4), survplot = pp5)

## ----newdata_23188-------------------------------------------------------
#  ndL <- pbcLong[pbcLong$id == 8, , drop = FALSE]
#  ndE <- pbcSurv[pbcSurv$id == 8, , drop = FALSE]
#  ndL$id <- paste0("new_patient")
#  ndE$id <- paste0("new_patient")

## ----plots_999333--------------------------------------------------------
#  p6 <- posterior_traj(mod3, m = 1,
#                       newdataLong = ndL,
#                       newdataEvent = ndE,
#                       last_time = "futimeYears")
#  pp6 <- plot(p6, plot_observed = TRUE, vline = TRUE)
#  pp6

## ----plots_122223--------------------------------------------------------
#  p7 <- posterior_traj(mod3, m = 2,
#                       newdataLong = ndL,
#                       newdataEvent = ndE,
#                       last_time = "futimeYears")
#  pp7 <- plot(p7, plot_observed = TRUE, vline = TRUE)
#  pp7

## ----plots_65401---------------------------------------------------------
#  p8 <- posterior_survfit(mod3,
#                          newdataLong = ndL,
#                          newdataEvent = ndE,
#                          last_time = "futimeYears")
#  pp8 <- plot(p8)
#  pp8

## ----plots_0089231, fig.height=13----------------------------------------
#  plot_stack_jm(yplot = list(pp6, pp7), survplot = pp8)

## ----b_pars_23123--------------------------------------------------------
#  c(ranef(mod3)[["Long1"]][["id"]][8,],
#    ranef(mod3)[["Long2"]][["id"]][8,])

## ----b_pars_5436765------------------------------------------------------
#  colMeans(attr(p6, "b_new"))

## ----newdata_19213-------------------------------------------------------
#  ndL <- expand.grid(year = seq(0, 10, 1),
#                     sex = c("m", "f"),
#                     trt = 0:1)
#  ndL$id <- rep(c("male_notrt", "female_notrt",
#                  "male_trt", "female_trt"), each = 11)
#  ndL <- ndL[, c(4,1,2,3)]
#  str(ndL)

## ----plot_traj_218391----------------------------------------------------
#  p1 <- posterior_traj(mod3, m = 1, newdataLong = ndL, dynamic = FALSE)
#  plot(p1) + ggplot2::coord_cartesian(ylim = c(-10,15))

## ----fixef_2132----------------------------------------------------------
#  fixef(mod3)$Long1

## ----ranef_5664----------------------------------------------------------
#  VarCorr(mod3)

## ----standsurv-----------------------------------------------------------
#  p1 <- posterior_survfit(mod3, standardise = TRUE, times = 0)
#  head(p1) # data frame with standardised survival probabilities
#  plot(p1) # plot the standardised survival curve

