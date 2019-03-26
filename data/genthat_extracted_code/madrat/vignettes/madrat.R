## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ---- echo = TRUE, eval=FALSE--------------------------------------------
#  library(madrat)
#  cfg <- getConfig()
#  #> Initialize madrat config with default settings..
#  #> madrat mainfolder for data storage not set! Do you want to set it now? (y/n)

## ---- echo = TRUE--------------------------------------------------------
madrat:::downloadTau

## ---- echo = TRUE, eval=FALSE--------------------------------------------
#  downloadSource("Tau", overwrite = TRUE)

## ---- echo = TRUE--------------------------------------------------------
madrat:::readTau

## ---- echo = TRUE, eval=FALSE--------------------------------------------
#  x <- readSource("Tau", "paper", convert=FALSE)

## ---- echo = TRUE--------------------------------------------------------
madrat:::convertTau

## ---- echo = TRUE, eval=FALSE--------------------------------------------
#  x <- readSource("Tau", "paper")

## ---- echo = TRUE--------------------------------------------------------
madrat:::calcTauTotal

## ---- echo = TRUE, eval=FALSE--------------------------------------------
#  x <- calcOutput("TauTotal")

## ---- echo = TRUE--------------------------------------------------------
madrat:::fullEXAMPLE

## ---- echo = TRUE, eval=FALSE--------------------------------------------
#  retrieveData("example", rev=1)

## ---- echo = TRUE , eval=FALSE-------------------------------------------
#  library(madrat)
#  
#  # add global environment to madrat search path
#  setConfig(globalenv=TRUE)
#  
#  # define simple calc-function
#  calcPi <- function() {
#    out <- toolCountryFill(NULL,fill=pi)
#    return(list(x=out,
#                weight=out,
#                unit="1",
#                description="Just pi"))
#  }
#  
#  # rund calcPi through wrapper function calcOutput
#  calcOutput("Pi")
#  

## ---- eval=FALSE---------------------------------------------------------
#  Depends: madrat(>= 1.00)

## ---- eval=FALSE---------------------------------------------------------
#  ### madrat.R
#  #' @importFrom madrat vcat
#  
#  .onLoad <- function(libname, pkgname){
#    madrat::setConfig(packages=c(madrat::getConfig("packages"),pkgname),
#                      .cfgchecks=FALSE, .verbose=FALSE)
#  }
#  
#  #create an own warning function which redirects calls to vcat (package internal)
#  warning <- function(...) vcat(0,...)
#  
#  # create a own stop function which redirects calls to stop (package internal)
#  stop <- function(...) vcat(-1,...)
#  
#  # create an own cat function which redirects calls to cat (package internal)
#  cat <- function(...) vcat(1,...)

