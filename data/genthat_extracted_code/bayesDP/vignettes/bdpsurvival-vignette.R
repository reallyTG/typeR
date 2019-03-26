## ---- SETTINGS-knitr, include=FALSE--------------------------------------
library(bayesDP)
stopifnot(require(knitr))
opts_chunk$set(
  #comment = NA,
  #message = FALSE,
  #warning = FALSE,
  #eval = if (isTRUE(exists("params"))) params$EVAL else FALSE,
  dev = "png",
  dpi = 150,
  fig.asp = 0.8,
  fig.width = 5,
  out.width = "60%",
  fig.align = "center"
  )
  
# Run two models to document the discount function plots
set.seed(42)  
fit01 <- bdpbinomial(y_t=10, N_t=500, y0_t=25, N0_t=250, method="fixed")
fit02 <- bdpbinomial(y_t=10, N_t=500, y0_t=10, N0_t=250, method="fixed",
                     discount_function="weibull")

fit_scaledweibull <- bdpbinomial(y_t=10, N_t=500, y0_t=25, N0_t=250, 
                                 discount_function="scaledweibull",
                                 method="fixed")
fit_identity <- bdpbinomial(y_t=10, N_t=500, y0_t=10, N0_t=250,
                            method="fixed")

## ---- echo=FALSE---------------------------------------------------------
df2 <- plot(fit_identity, type="discount", print=FALSE)
df2 + ggtitle("Discount function plot", "Identity")

## ---- echo=FALSE---------------------------------------------------------
df1 <- plot(fit02, type="discount", print=FALSE)
df1 + ggtitle("Discount function plot", "Weibull distribution with shape=3 and scale=0.135")

## ------------------------------------------------------------------------
p1 <- plot(fit02, type="discount", print=FALSE)
p1 + ggtitle("Discount Function Plot :-)")

## ------------------------------------------------------------------------
set.seed(42)
# Simulate survival times for current and historical data
surv_1arm <- data.frame(status = 1,
                        time   = rexp(10, rate=1/10))

# Simulate survival times for historical data
surv_1arm0 <- data.frame(status = 1,
                         time   = rexp(50, rate=1/11))

## ------------------------------------------------------------------------
set.seed(42)
fit1 <- bdpsurvival(Surv(time, status) ~ 1,
                    data  = surv_1arm,
                    data0 = surv_1arm0,
                    surv_time = 5,
                    method = "fixed")
print(fit1)

## ---- include=FALSE------------------------------------------------------
survival_time_posterior <- ppexp(5,
                                 fit1$posterior_treatment$posterior_hazard,
                                 cuts=c(0,fit1$args1$breaks))
surv_augmented1 <- round(1-median(survival_time_posterior), 4)
CI95_augmented1 <- round(1-quantile(survival_time_posterior, prob=c(0.975, 0.025)), 4)

## ------------------------------------------------------------------------
summary(fit1)

## ------------------------------------------------------------------------
set.seed(42)
fit1a <- bdpsurvival(Surv(time, status) ~ 1,
                    data  = surv_1arm,
                    data0 = surv_1arm0,
                    surv_time = 5,
                    alpha_max = 1,
                    fix_alpha = TRUE,
                    method = "fixed")

print(fit1a)

## ------------------------------------------------------------------------
survival_time_posterior <- ppexp(5,
                                 fit1a$posterior_treatment$posterior_hazard,
                                 cuts=c(0,fit1a$args1$breaks))
surv_augmented <- 1-median(survival_time_posterior)
CI95_augmented <- 1-quantile(survival_time_posterior, prob=c(0.975, 0.025))

## ------------------------------------------------------------------------
plot(fit1, type="survival")
plot(fit1, type="discount")

## ------------------------------------------------------------------------
set.seed(42)
# Simulate survival times for treatment data
time_current_trt    <- rexp(10, rate=1/10)
time_historical_trt <- rexp(50, rate=1/11)

# Simulate survival times for control data
time_current_cntrl    <- rexp(10, rate=1/12)
time_historical_cntrl <- rexp(50, rate=1/12)


# Combine simulated data into data frames
surv_2arm <- data.frame(treatment = c(rep(1,10),rep(0,10)),
                        time      = c(time_current_trt, time_current_cntrl),
                        status    = 1)

surv_2arm0 <- data.frame(treatment = c(rep(1,50),rep(0,50)),
                         time      = c(time_historical_trt, time_historical_cntrl),
                         status    = 1)

## ------------------------------------------------------------------------
set.seed(42)
fit2 <- bdpsurvival(Surv(time, status) ~ treatment,
                    data = surv_2arm,
                    data0 = surv_2arm0,
                    method = "fixed")
print(fit2)

