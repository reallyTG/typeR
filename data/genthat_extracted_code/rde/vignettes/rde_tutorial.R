## ----setup, include = FALSE----------------------------------------------
library(knitr)
library(rde)
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----include=FALSE-------------------------------------------------------
fname <- system.file("extdata", "country_pop.csv", package = "rde")

## ----eval=FALSE, include=TRUE--------------------------------------------
#  fname <- "country_pop.csv"

## ------------------------------------------------------------------------
pop.data <- read.csv(fname, stringsAsFactors = FALSE)

## ------------------------------------------------------------------------
kable(pop.data)

## ------------------------------------------------------------------------
library(rde)

pop.data <- load_rde_var(
  use.cache = FALSE,
  load.fcn = {
    read.csv(fname, stringsAsFactors = FALSE)
  },
  cache = NULL  # We'll fill this in shortly
)

## ----eval=FALSE, include=TRUE--------------------------------------------
#  copy_rde_var(pop.data)

## ------------------------------------------------------------------------
library(rde)

pop.data <- load_rde_var(
  use.cache = FALSE,
  load.fcn = {
    fname <- system.file("extdata", "country_pop.csv", package = "rde")
    read.csv(fname, stringsAsFactors = FALSE)
  },
  cache = "
    rde1QlpoOTFBWSZTWQy+/kYAAIB3/v//6EJABRg/WlQv797wYkAAAMQiABBAACAAAZGwANk0RTKejU9T
    RoBoGgGjTRoBoGgaGymE0Kp+qemmkDNQ0YmJk0AA0xNADQNPUaA0JRhDTJoANAAAAAAAAEJx2Eja7QBK
    MKPPkRAx63wSAWt31AABs1zauhwHifs5WlltyIyQKAAAZEAZGQYMIZEA6ZAPHVMEB71jSCqdlsiR/eSY
    kzQkRq5RoXgvNNZnB5RSOvKaTGFtc/SXc74AhzqhMEJvdisEGVfo7UYngc0AwGqTvTHx8CBZTzE9OQZZ
    VY8KAhHAhrG4RCeilM0rXKkdpjGqyNgJwAkmnPQOMYrLlQ4YTIv0WyxfYdkd9WSWUsvggC/i7kinChIB
    l9/IwA==
  "
)

