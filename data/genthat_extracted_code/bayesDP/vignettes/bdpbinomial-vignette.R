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
fit1 <- bdpbinomial(y_t       = 15,
                    N_t       = 200,
                    y0_t      = 25,
                    N0_t      = 250,
                    alpha_max = 1,
                    fix_alpha = TRUE,
                    method    = "fixed")
summary(fit1)

## ------------------------------------------------------------------------
set.seed(42)
fit1a <- bdpbinomial(y_t       = 15,
                     N_t       = 200,
                     y0_t      = 25,
                     N0_t      = 250,
                     alpha_max = 1,
                     fix_alpha = FALSE,
                     method    = "fixed")
summary(fit1a)

## ------------------------------------------------------------------------
mean_augmented <- round(median(fit1a$posterior_treatment$posterior),4)
mean_augmented

CI95_augmented <- round(quantile(fit1a$posterior_treatment$posterior, prob=c(0.025, 0.975)),4)
CI95_augmented

## ------------------------------------------------------------------------
plot(fit1a, type="posteriors")
plot(fit1a, type="density")
plot(fit1a, type="discount")

## ------------------------------------------------------------------------
set.seed(42)
fit2 <- bdpbinomial(y_t  = 15,
                    N_t  = 200,
                    y0_t = 25,
                    N0_t = 250,
                    y_c  = 20,
                    N_c  = 250,
                    y0_c = 20,
                    N0_c = 250,
                    method = "fixed")
summary(fit2)

## ------------------------------------------------------------------------
plot(fit2, type="posteriors")
plot(fit2, type="density")
plot(fit2, type="discount")

