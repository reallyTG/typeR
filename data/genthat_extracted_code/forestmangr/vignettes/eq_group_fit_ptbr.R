## ---- echo = FALSE, message = FALSE, warning=FALSE-----------------------
knitr::opts_chunk$set(collapse = T, comment = "#>")
knitr::opts_chunk$set(fig.width=7, fig.height=5)
options(tibble.print_min = 6L, tibble.print_max = 6L)
library(forestmangr)
library(dplyr)
library(tidyr)

## ------------------------------------------------------------------------
library(forestmangr)
library(dplyr)
library(tidyr)

data(exfm14)
dados <- exfm14 %>% filter(strata%in%1:10)
dados

## ------------------------------------------------------------------------
mod1 <- lm_table(dados, log(dh) ~ inv(age))
mod1

## ------------------------------------------------------------------------
mod2 <- nls_table(dados, dh ~ b0 * (1 - exp( -b1 * age )  )^b2, 
          mod_start = c( b0=23, b1=0.03, b2 = 1.3  ) )
mod2

## ------------------------------------------------------------------------
mod1 <- lm_table(dados, log(dh) ~ inv(age), .groups = "strata")
mod1

## ------------------------------------------------------------------------
mod2 <- nls_table(dados, dh ~ b0 * (1 - exp( -b1 * age )  )^b2, 
          mod_start = c( b0=23, b1=0.03, b2 = 1.3  ),
          .groups = "strata" )
mod2

## ------------------------------------------------------------------------
tab_start <- data.frame(strata = c(1:10), 
              rbind(
              data.frame(b0=rep(23, 5),b1=rep(0.03,5),b2=rep(1.3,5) ), 
              data.frame(b0=rep(23, 5),b1=rep(0.03,5),b2=rep(.5,5) )))
tab_start

## ------------------------------------------------------------------------
mod2 <- nls_table(dados, dh ~ b0 * (1 - exp( -b1 * age )  )^b2, 
          mod_start = tab_start,
          .groups = "strata" )
mod2

## ------------------------------------------------------------------------
dados_est <- dados %>% 
  lm_table(log(dh) ~ inv(age), .groups = "strata",
           output = "merge_est", est.name = "Schumacher") %>% 
  
  nls_table(dh ~ b0 * (1 - exp( -b1 * age )  )^b2, 
          mod_start = c( b0=23, b1=0.03, b2 = 1.3  ),.groups="strata",
          output ="merge_est",est.name="Chapman-Richards") %>% 
  
  nls_table(log(dh) ~ b0 + b1 * ( inv(age)^b2 ) , 
          mod_start = c( b0=3, b1=-130, b2 = 1.5),.groups = "strata",
          output ="merge_est",est.name = "Bailey-Clutter") %>% 
  
  lm_table(dh ~ inv(age), .groups = "strata",
           output = "merge_est", est.name = "Curtis") 

head(dados_est)  
  

## ------------------------------------------------------------------------
dados_est %>% 
  gather(Model, Value, 
         Schumacher, `Chapman-Richards`, `Bailey-Clutter`, Curtis) %>% 
  group_by(Model) %>% 
  summarise(
    RMSE = rmse_per(y = dh, yhat = Value),
    BIAS = bias_per(y = dh, yhat = Value) )

## ---- warning=FALSE, message=FALSE---------------------------------------
resid_plot(dados_est, "dh", "Schumacher", "Chapman-Richards", "Bailey-Clutter", "Curtis")

## ---- warning=FALSE, message=FALSE---------------------------------------
resid_plot(dados_est, "dh", "Schumacher","Chapman-Richards","Bailey-Clutter", "Curtis",
           type = "histogram_curve")

## ---- warning=FALSE, message=FALSE---------------------------------------
resid_plot(dados_est, "dh", "Schumacher", "Chapman-Richards", "Bailey-Clutter", "Curtis",
           type = "versus")

