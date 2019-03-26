## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(parmsurvfit)

fit_data(data = firstdrink, 
         dist = "weibull", 
         time = "age", 
         censor = "censor")

## ------------------------------------------------------------------------
plot_density(data = firstdrink, 
             dist = "weibull", 
             time = "age", 
             censor = "censor", 
             by = "gender")

## ------------------------------------------------------------------------
plot_ppsurv(data = firstdrink, 
            dist = "weibull", 
            time = "age", 
            censor = "censor")

## ------------------------------------------------------------------------
compute_AD(data = firstdrink, 
           dist = "weibull", 
           time = "age", 
           censor = "censor")

## ------------------------------------------------------------------------
plot_surv(data = firstdrink, 
          dist = "weibull", 
          time = "age", 
          censor = "censor", 
          by = "gender")

## ------------------------------------------------------------------------
plot_haz(data = firstdrink, 
         dist = "weibull", 
         time = "age", 
         censor = "censor",
         by = "gender")

## ------------------------------------------------------------------------
plot_cumhaz(data = firstdrink, 
            dist = "weibull", 
            time = "age", 
            censor = "censor",  
            by = "gender")

## ------------------------------------------------------------------------
surv_prob(data = firstdrink, 
          dist = "weibull", 
          x = 30, 
          lower.tail = F, 
          time = "age", 
          censor = "censor", 
          by = "gender")

## ----stats---------------------------------------------------------------
surv_summary(data = firstdrink, 
             dist = "weibull", 
             time = "age", 
             censor = "censor", 
             by = "gender")

