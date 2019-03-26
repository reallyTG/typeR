## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(debugr)

myfunction <- function(x) {
  justastring <- "Not much information here"
  z <- 1

  for(i in 1:x) {
    dwatch(crit = "z > 40000", objs = c("z"))
    z <- z * i
  }
  invisible(z)
}

## ------------------------------------------------------------------------
myfunction(10)

## ------------------------------------------------------------------------
debugr_switchOn()

myfunction(10)

## ------------------------------------------------------------------------
debugr_isActive()

## ----echo = FALSE--------------------------------------------------------
myfunction <- function(x) {
  justastring <- "Not much information here"
  z <- 1

  for(i in 1:x) {
    dwatch(crit = "z > 40000", objs = c("z"), funs=c("format"), args = as.list(c(big.mark = "\",\"")))
    z <- z * i
  }
  invisible(z)
}

myfunction(10)

## ------------------------------------------------------------------------
myfunction <- function(x) {
  justastring <- "Not much information here"
  z <- 1

  for(i in 1:x) {
    dwatch(crit = "z > 40000", expr=c("format(z, big.mark = \",\")"))
    z <- z * i
  }
  invisible(z)
}

myfunction(10)

## ------------------------------------------------------------------------
myfunction <- function(x) {
  justastring <- "Not much information here"
  z <- 1

  for(i in 1:x) {
    dwatch(crit = "z > 40000", show.all = TRUE)
    z <- z * i
  }
  invisible(z)
}

myfunction(10)

