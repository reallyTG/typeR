## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----show-shadow---------------------------------------------------------
library(naniar)
as_shadow(oceanbuoys)

## ----show-bind-shadow----------------------------------------------------
bind_shadow(oceanbuoys)

## ----create-toy-dataset--------------------------------------------------
df <- tibble::tribble(
~wind, ~temp,
-99,    45,
68,    NA,
72,    25
)

df

## ----create-nab----------------------------------------------------------

dfs <- bind_shadow(df)

dfs

## ----example-recode-shadow-----------------------------------------------
dfs_recode <- dfs %>% 
  recode_shadow(wind = .where(wind == -99 ~ "broken_machine"))

## ----show-additional-factor-levels---------------------------------------
levels(dfs_recode$wind_NA)
levels(dfs_recode$temp_NA)

