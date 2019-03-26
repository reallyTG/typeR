## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, screenshot.force = FALSE, comment = "#>", collapse = TRUE)

## ----eval=FALSE----------------------------------------------------------
#  # If the BioInstaller R package has not been installed,
#  # you need execute the followed commands:
#  # install.packages('BioInstaller')
#  # It is better to start the worker in another background processor
#  BioInstaller::set_shiny_workers(3)
#  BioInstaller::web(auto_create = TRUE)

