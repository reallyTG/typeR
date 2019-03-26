## ---- echo = FALSE, results='asis'---------------------------------------
# Include badges only when making the github markdown
library(knitr)
if ("github_markdown" %in% knitr::opts_knit$get("rmarkdown.pandoc.to")) {
  cat("
[![License](http://img.shields.io/badge/license-GPL%20%28%3E=%202%29-brightgreen.svg?style=flat)](http://www.gnu.org/licenses/gpl-2.0.html)
[![Travis-CI Build Status](https://travis-ci.org/drknexus/naptime.svg?branch=master)](https://travis-ci.org/drknexus/naptime)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/naptime)](https://cran.r-project.org/package=naptime)
[![codecov.io](https://codecov.io/github/drknexus/naptime/coverage.svg?branch=master)](https://codecov.io/github/drknexus/naptime?branch=master)
      ")
}

## ---- echo = FALSE, results = 'hide', message = FALSE--------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "README-"
)
library(naptime)
library(lubridate)

## ------------------------------------------------------------------------
naptime(1)

## ------------------------------------------------------------------------
naptime(lubridate::now(tzone = "UTC")+lubridate::seconds(1))

## ------------------------------------------------------------------------
naptime(lubridate::seconds(1))

## ------------------------------------------------------------------------
naptime(as.character(lubridate::now() + lubridate::seconds(1)))

## ------------------------------------------------------------------------
naptime(difftime(lubridate::now() + lubridate::seconds(1), lubridate::now()))

## ------------------------------------------------------------------------
naptime(TRUE)

## ------------------------------------------------------------------------
naptime(NULL)

## ------------------------------------------------------------------------
naptime(glm(rnorm(5) ~ runif(5)), permissive = TRUE)
options(naptime.permissive = TRUE)
naptime(glm(rnorm(5) ~ runif(5)))

