## ----echo=FALSE----------------------------------------------------------
knitr::opts_chunk$set(
	comment = "#>",
	collapse = TRUE,
	warning = FALSE,
	message = FALSE,
  eval = FALSE
)

## ----eval=FALSE----------------------------------------------------------
#  install.packages("vcr")

## ----eval=FALSE----------------------------------------------------------
#  remotes::install_github("ropensci/vcr")

## ------------------------------------------------------------------------
#  library("vcr")

## ----echo=FALSE----------------------------------------------------------
#  suppressPackageStartupMessages(require(vcr, quietly = TRUE))
#  unlink(file.path(cassette_path(), "helloworld.yml"))

## ------------------------------------------------------------------------
#  library(vcr)
#  library(crul)
#  
#  cli <- crul::HttpClient$new(url = "https://eu.httpbin.org")
#  system.time(
#    use_cassette(name = "helloworld", {
#      cli$get("get")
#    })
#  )

## ------------------------------------------------------------------------
#  system.time(
#    use_cassette(name = "helloworld", {
#      cli$get("get")
#    })
#  )

## ----echo=FALSE----------------------------------------------------------
#  unlink(file.path(cassette_path(), "helloworld.yml"))

