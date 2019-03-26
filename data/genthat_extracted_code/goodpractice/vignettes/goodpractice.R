## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(goodpractice)

# get path to example package
pkg_path <- system.file("bad1", package = "goodpractice")

# run gp() on it
g <- gp(pkg_path)

# show the result
g

## ------------------------------------------------------------------------
# what is the name of the check?
grep("url", all_checks(), value = TRUE)

# run only this check
g_url <- gp(pkg_path, checks = "description_url")

g_url

## ------------------------------------------------------------------------
# which checks were carried out?
checks(g_url)

# which checks failed?
failed_checks(g)

## ------------------------------------------------------------------------
# show the first 5 checks carried out and their results
results(g)[1:5,]

