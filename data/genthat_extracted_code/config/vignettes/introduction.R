## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(eval = FALSE, results = 'hide')
Sys.setenv(R_CONFIG_ACTIVE = "default")

## ------------------------------------------------------------------------
#  install.packages("config")

## ------------------------------------------------------------------------
#  config <- config::get()
#  config$trials
#  config$dataset

## ------------------------------------------------------------------------
#  config::get("trials")
#  config::get("dataset")

## ------------------------------------------------------------------------
#  # set the active configuration globally via Renviron.site or Rprofile.site
#  Sys.setenv(R_CONFIG_ACTIVE = "production")
#  
#  # read configuration value (will return 30 from the "production" config)
#  config::get("trials")

## ------------------------------------------------------------------------
#  config::is_active("production")

## ---- include=FALSE------------------------------------------------------
#  Sys.setenv(R_CONFIG_ACTIVE = "default")

## ---- eval=FALSE---------------------------------------------------------
#  config <- config::get(file = "conf/config.yml")

## ---- eval=FALSE---------------------------------------------------------
#  config <- config::get(file = "conf/config.yml", use_parent = FALSE)

