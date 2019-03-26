## ---- echo = FALSE, message = FALSE--------------------------------------
knitr::opts_chunk$set(collapse = T, comment = "#>")
knitr::opts_chunk$set(fig.width=7, fig.height=5)
options(tibble.print_min = 6L, tibble.print_max = 6L)
library(forestmangr)
library(dplyr)

## ------------------------------------------------------------------------
library(forestmangr)
library(dplyr)
data(exfm16)

data_ex <- exfm16
data_ex

## ------------------------------------------------------------------------
index_age <- 64
data_ex <-  data_ex %>% 
  nls_table(DH ~ b0 * (1 - exp( -b1 * age )  )^b2, 
            mod_start = c( b0=23, b1=0.03, b2 = 1.3), 
            output = "merge" ) %>% 
  mutate(S = DH *( (  (1- exp( -b1/age ))^b2   ) / 
                     (( 1 - exp(-b1/index_age))^b2 ))  ) %>% 
  select(-b0,-b1,-b2)
head(data_ex)

## ------------------------------------------------------------------------
coefs_clutter <- fit_clutter(data_ex, "age", "DH", "B", "V", "S", "plot")
coefs_clutter

## ------------------------------------------------------------------------
data_ex_class <- classify_site(data_ex, "S", 3, "plot")
head(data_ex_class)

## ------------------------------------------------------------------------
data_ex_est <- est_clutter(data_ex_class, 20:125,"B", "S", "category_", coefs_clutter) 
data_ex_est

## ------------------------------------------------------------------------
est_clutter(data_ex_class, 20:125,"B", "S", "category_", coefs_clutter,output="plot")

