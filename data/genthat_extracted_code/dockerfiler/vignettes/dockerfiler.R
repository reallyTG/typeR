## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----gh-installation, eval = FALSE---------------------------------------
#  # install.packages("devtools")
#  devtools::install_github("colinfay/dockerfiler")

## ------------------------------------------------------------------------
library(dockerfiler)
# Create a dockerfile template
my_dock <- Dockerfile$new()
my_dock$MAINTAINER("Colin FAY", "contact@colinfay.me")

## ------------------------------------------------------------------------
my_dock$RUN(r(install.packages("attempt", repo = "http://cran.irsn.fr/")))

## ------------------------------------------------------------------------
my_dock$RUN("mkdir /usr/scripts")
my_dock$RUN("cd /usr/scripts")
my_dock$COPY("plumberfile.R", "/usr/scripts/plumber.R")
my_dock$COPY("torun.R", "/usr/scripts/torun.R")
my_dock$EXPOSE(8000)
my_dock$CMD("Rscript /usr/scripts/torun.R ")

## ------------------------------------------------------------------------
my_dock

## ------------------------------------------------------------------------
# Switch line 8 and 7
my_dock$switch_cmd(8, 7)
my_dock

## ------------------------------------------------------------------------
my_dock$remove_cmd(8)
my_dock

## ------------------------------------------------------------------------
my_dock$remove_cmd(5:7)
my_dock

## ----eval = FALSE--------------------------------------------------------
#  my_dock$write()

