## ----setup, include=FALSE-----------------------------------------------------
knitr::knit_hooks$set(
  mySettings  = function(before, options, envir){
    if (before && options$mySettings){ 
      par(
        mar = c(5, 5, 1, 1),
        bty = "n",
        xaxs = "i",
        pch=16,
        cex= (cex <- .4),
        cex.axis = .8 / cex,
        cex.lab = .8 / cex,
        lwd= 1)
    } else if(before && options$plot_2x1){
      par(
        mfcol = c(2, 1),
        mar = c(4, 4, 2, 2), 
        cex = .75)
    }})

options(digits = 3, width = 80, warn = -1)

knitr::opts_chunk$set(
  echo = TRUE, mySettings=TRUE, fig.height=3.5, fig.width = 6,
  warning = F, message = F, plot_2x1 = FALSE)

knitr::opts_knit$set(warning = F, message = F)

## ----echo=FALSE---------------------------------------------------------------
tryCatch({
  current_sha <- paste0("@", httr::content(
    httr::GET("https://api.github.com/repos/boennecd/dynamichazard/git/refs/heads/master")
    )$object$sha)
}, error = function(...){ current_sha <<- "" })

stopifnot(length(current_sha) > 0 && class(current_sha) == "character")

current_version <- paste0("boennecd/dynamichazard@", current_sha)

## -----------------------------------------------------------------------------
current_version # The string you need to pass devtools::install_github

## ----eval=FALSE---------------------------------------------------------------
#  devtools::install_github(current_version)

## ----eval=FALSE---------------------------------------------------------------
#  install.packages("dynamichazard")

## -----------------------------------------------------------------------------
# PBC data set from survival with time variying covariates
# Details of tmerge are not important in this scope. The code is included
# to make you able to reproduce the results
# See: https://cran.r-project.org/web/packages/survival/vignettes/timedep.pdf
library(survival)
temp <- subset(pbc, id <= 312, select=c(id, sex, time, status, edema, age))
pbc2 <- tmerge(temp, temp, id=id, death = event(time, status))
pbc2 <- tmerge(pbc2, pbcseq, id=id, albumin = tdc(day, albumin),
               protime = tdc(day, protime), bili = tdc(day, bili))
pbc2 <- pbc2[, c("id", "tstart", "tstop", "death", "sex", "edema", 
                 "age", "albumin", "protime", "bili")]

## -----------------------------------------------------------------------------
head(pbc2)

## -----------------------------------------------------------------------------
(ex <- pbc2[pbc2$id == 282, ])

## -----------------------------------------------------------------------------
glm_simple <- glm(death == 2 ~ age + edema + log(albumin) + log(protime) + 
                    log(bili), binomial, pbc2)

glm_simple$coefficients

## -----------------------------------------------------------------------------
library(dynamichazard)
pbc2_big_frame <- get_survival_case_weights_and_data(
  Surv(tstart, tstop, death == 2) ~ age + edema + log(albumin) + log(protime) +
    log(bili), data = pbc2, id = pbc2$id, by = 100, max_T = 3600, 
  use_weights = F)
pbc2_big_frame <- pbc2_big_frame$X

## -----------------------------------------------------------------------------
pbc2_big_frame[pbc2_big_frame$id == 282, ]

## -----------------------------------------------------------------------------
pbc2_small_frame <- get_survival_case_weights_and_data(
  Surv(tstart, tstop, death == 2) ~ age + edema + log(albumin) + log(protime) +
    log(bili), data = pbc2, id = pbc2$id, by = 100, max_T = 3600, 
  use_weights = T)
pbc2_small_frame <- pbc2_small_frame$X

## -----------------------------------------------------------------------------
pbc2_small_frame[pbc2_small_frame$id == 282, ]

## -----------------------------------------------------------------------------
pbc2[pbc2$id == 268, ] # the orginal data
pbc2_small_frame[pbc2_small_frame$id == 268, ] # new data

## -----------------------------------------------------------------------------
glm_fit_big <- glm(Y ~ age + edema + log(albumin) + log(protime) + 
                    log(bili), binomial, pbc2_big_frame)
glm_fit_small <- glm(Y ~ age + edema + log(albumin) + log(protime) + 
                      log(bili), binomial, pbc2_small_frame, 
                     weights = pbc2_small_frame$weights) # <-- we use weights

## -----------------------------------------------------------------------------
all.equal(glm_fit_big$coefficients, glm_fit_small$coefficients)

## -----------------------------------------------------------------------------
knitr::kable(
  rbind("glm with bins" = glm_fit_big$coefficients, 
        "glm without bins" = glm_simple$coefficients, 
        "Sds with bins" = 
          summary(glm_fit_big)[["coefficients"]][, "Std. Error"],
        "Sds without bins" = 
          summary(glm_simple)[["coefficients"]][, "Std. Error"]),
  row.names = T)

## -----------------------------------------------------------------------------
static_glm_fit <- static_glm(
  Surv(tstart, tstop, death == 2) ~ age + edema + log(albumin) + log(protime) +
    log(bili), data = pbc2, id = pbc2$id, by = 100, max_T = 3600)

all.equal(static_glm_fit$coefficients, glm_fit_big$coefficients)

## ----message=FALSE------------------------------------------------------------
library(mgcv, quietly = T)
spline_fit <- gam(
  formula = Y ~ 
    # cr is cubic spline with k knots
    s(t, bs = "cr", k = 3, by = age) + 
    s(t, bs = "cr", k = 3, by = edema) + 
    s(t, bs = "cr", k = 5, by = log(albumin)) + 
    s(t, bs = "cr", k = 5, by = log(protime)) + 
    s(t, bs = "cr", k = 5, by = log(bili)),
  family = binomial, data = pbc2_big_frame)

## ---- fig.height = 4.5, mySettings=FALSE, fig.cap="Plots of estimated effects in the GAM model. The effective degree of freedom is noted in the parentheses on the y-axis and is computed given the number knots and final tuning parameter for spline function. For instance, `s(t,2.43):age` means that the effective degrees of freedom for `age` is `2.43`."----
plot(spline_fit, scale = 0, page = 1, rug = F)

## -----------------------------------------------------------------------------
glm_fit_big$coefficients

## -----------------------------------------------------------------------------
spline_fit$coefficients["(Intercept)"]

## ---- message=FALSE, fig.height = 7, mySettings=FALSE-------------------------
library(timereg)
cox_fit<- timecox(Surv(tstart / 365, tstop / 365, death == 2) ~ age + edema +
                        log(albumin) + const(log(protime)) + log(bili), pbc2,
                  start.time=0, 
                  max.time = 3000 / 365, # <-- decreased
                  id = pbc2$id, bandwidth = 0.35)

par(mfcol = c(3, 2))
plot(cox_fit)

## ---- message=FALSE, fig.height = 6, mySettings=FALSE-------------------------
summary(cox_fit)

## ---- fig.height = 4.5, mySettings=FALSE--------------------------------------
library(dynamichazard)
dd_fit <- ddhazard(Surv(tstart, tstop, death == 2) ~ age + edema +
                        log(albumin) + log(protime) + log(bili), pbc2,
                   id = pbc2$id, by = 100, max_T = 3600, 
                   Q_0 = diag(100, 6), Q = diag(0.01, 6),
                   control = ddhazard_control(eps = .001))

plot(dd_fit)

## ---- fig.height = 4.5, mySettings=FALSE--------------------------------------
# Pre-computed sds of covariates
sds <- c(1, 10, .2, .2, .1, 1)

dd_fit <- ddhazard(
  Surv(tstart, tstop, death == 2) ~ age + edema +
    log(albumin) + log(protime) + log(bili), pbc2,
  id = pbc2$id, by = 100, max_T = 3600,
  Q_0 = diag(10 / sds), Q = diag(0.01 / sds, 6),
  control = ddhazard_control(
    eps = .001,
    NR_eps = 0.0001, # Tolerance in correction step
    LR = .33
  ))

# Plot result
plot(dd_fit)

## ---- fig.height = 4.5, mySettings=FALSE--------------------------------------
dd_fit_UKF <- ddhazard(
  Surv(tstart, tstop, death == 2) ~ age +
         edema + log(albumin) + log(protime) + log(bili), pbc2,
   id = pbc2$id, by = 100, max_T = 3600, 
   Q_0 = diag(rep(1, 6)), Q = diag(rep(0.01, 6)),
   control = ddhazard_control(method = "UKF", beta = 0, alpha = 1,
                              eps = 0.1, n_max = 1e4))

plot(dd_fit_UKF)

## ---- eval=FALSE--------------------------------------------------------------
#  # Not run
#  tmp_file <- file("pick_some_file_name.txt")
#  sink(tmp_file)
#  dd_fit_UKF <- ddhazard(
#    Surv(tstart, tstop, death == 2) ~ age +
#           edema + log(albumin) + log(protime) + log(bili), pbc2,
#     id = pbc2$id, by = 100, max_T = 3600,
#     Q_0 = diag(rep(1, 6)), Q = diag(rep(0.01, 6)),
#     control =
#       ddhazard_control(method = "UKF", beta = 0, alpha = 1,
#                        debug = T)) # <-- prints information in each iteration
#  sink()
#  close(tmp_file)

## -----------------------------------------------------------------------------
diag(dd_fit$Q)

## ---- fig.height = 4.5, mySettings=FALSE--------------------------------------
dd_fit_UKF <- ddhazard(
  Surv(tstart, tstop, death == 2) ~ age +
    edema + log(albumin) + log(protime) + log(bili), pbc2,
  id = pbc2$id, by = 100, max_T = 3600, 
  Q_0 = diag(c(0.001, 0.00001, rep(0.001, 4))) * 100, # <-- decreased
  Q = diag(0.0001, 6),                                # <-- decreased
  control = 
    ddhazard_control(method = "UKF", beta = 0, alpha = 1, eps = 0.001))

plot(dd_fit_UKF)

## ---- echo = FALSE------------------------------------------------------------
set.seed(7686280) # <-- Data is permuated so we set a seed

## -----------------------------------------------------------------------------
dd_fit_EKF <- 
  ddhazard(
    Surv(tstart, tstop, death == 2) ~ age + edema +
       log(albumin) + log(protime) + log(bili), pbc2,
    id = pbc2$id, by = 100, max_T = 3600,
    Q_0 = diag(100, 6), Q = diag(0.01, 6),
    control = ddhazard_control(eps = .001))

dd_fit_SMA <- 
  ddhazard(
    Surv(tstart, tstop, death == 2) ~ age + edema +
     log(albumin) + log(protime) + log(bili), pbc2,
    id = pbc2$id, by = 100, max_T = 3600,
    Q_0 = diag(100, 6), Q = diag(0.01, 6),
    control = ddhazard_control(
       method = "SMA", # change estimation method 
       eps = 0.001))

## ---- eval = FALSE------------------------------------------------------------
#  par(mfcol = c(2, 3))
#  for(i in 1:6){
#    plot(dd_fit_EKF, cov_index = i, col = "black")
#    plot(dd_fit_SMA, cov_index = i, col = "red", add = TRUE)
#  }

## ---- echo=FALSE--------------------------------------------------------------
par_old <- par(no.readonly = T)
par(mfcol = c(2, 3))
par(cex = par_old$cex * .85, mar = par_old$mar * 1.33)
for(i in 1:6){
  plot(dd_fit_EKF, cov_index = i, col = "black")
  plot(dd_fit_SMA, cov_index = i, col = "red", add = TRUE)
}

## ---- warning=FALSE-----------------------------------------------------------
dd_fit <- ddhazard(
  Surv(tstart, tstop, death == 2) ~ ddFixed_intercept() + 
    ddFixed(age) + ddFixed(log(albumin)) + edema + ddFixed(log(protime)) + 
    log(bili), 
  pbc2, id = pbc2$id, by = 100, max_T = 3600, 
  Q_0 = diag(100, 2), Q = diag(0.01, 2),
  control = ddhazard_control(eps = .001))

## ---- fig.height = 5, mySettings=FALSE, plot_2x1 = TRUE-----------------------
plot(dd_fit)

## -----------------------------------------------------------------------------
dd_fit$fixed_effects

## -----------------------------------------------------------------------------
# Define formula
form <- Surv(tstart, tstop, death == 2) ~ 
                     ddFixed_intercept() + ddFixed(age) + 
                     ddFixed(edema) + ddFixed(log(albumin)) + 
                     ddFixed(log(protime)) + log(bili)

# Fit models
dd_fit_EKF <- 
  ddhazard(form, 
           pbc2, id = pbc2$id, by = 100, max_T = 3600, 
 
           order = 2,            # <-- second order
           Q_0 = diag(5, 2),     # <-- needs more elements
           Q = .0001,            # <-- decreased
          
           control = ddhazard_control(
             eps = .0001, est_a_0 = FALSE))

## -----------------------------------------------------------------------------
dd_fit_EKF$fixed_effects

## -----------------------------------------------------------------------------
plot(dd_fit_EKF)

