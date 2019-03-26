## ----echo=FALSE----------------------------------------------------------
knitr::opts_chunk$set(
    comment = "#>",
    collapse = TRUE,
    warning = FALSE,
    message = FALSE
)

## ------------------------------------------------------------------------
library(vcr)

## ----echo=FALSE, eval=FALSE----------------------------------------------
#  unlink(file.path(cassette_path(), "foo_bar.yml"))

## ----eval = FALSE--------------------------------------------------------
#  use_cassette(name = "foo_bar", {
#      cli$post("post", body = list(a = 5))
#    },
#    match_requests_on = c('method', 'headers', 'body')
#  )

## ----echo=FALSE, eval=FALSE----------------------------------------------
#  unlink(file.path(cassette_path(), "foo_bar.yml"))

## ----echo=FALSE, eval=FALSE----------------------------------------------
#  unlink(file.path(cassette_path(), "nothing_new.yml"))

## ----eval = FALSE--------------------------------------------------------
#  library(crul)
#  library(vcr)
#  cli <- crul::HttpClient$new("https://httpbin.org/get",
#    headers = list(foo = "bar"))
#  use_cassette(name = "nothing_new", {
#      one <- cli$get()
#    },
#    match_requests_on = 'headers'
#  )
#  cli$headers$foo <- "stuff"
#  use_cassette(name = "nothing_new", {
#      two <- cli$get()
#    },
#    match_requests_on = 'headers'
#  )
#  one$request_headers
#  two$request_headers

## ----echo=FALSE, eval=FALSE----------------------------------------------
#  unlink(file.path(cassette_path(), "nothing_new.yml"))

