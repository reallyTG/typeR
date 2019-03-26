## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(goodpractice)

# make a simple version of the T/F check
check_simple_tf <- make_check(
  
  description = "TRUE and FALSE is used, not T and F",
  gp = "avoid 'T' and 'F', use 'TRUE' and 'FALSE' instead.",
  check = function(state) {
      length(tools::checkTnF(dir = state$path)) == 0
  }
)

## ------------------------------------------------------------------------
# get path to example package
pkg_path <- system.file("bad1", package = "goodpractice")
gp(pkg_path, checks = c("simple_tf", "truefalse_not_tf"),
   extra_checks = list(simple_tf = check_simple_tf))

## ------------------------------------------------------------------------
# prep: process DESCRIPTION file
desc_fun <- function(path, quiet) {
  desc::description$new(path)
}

prep_desc <- make_prep(name = "desc", func = desc_fun)

# check for an URL field
check_url <- make_check(
  description = "URL field in DESCRIPTION",
  preps = "desc",
  gp = "have a URL field in DESCRIPTION",
  check = function(state) state$desc$has_fields("URL")
)

# check for a BugReport field
check_bugreports <- make_check(
  description = "BugReports in DESCRIPTION",
  preps = "desc",
  gp = "add a BugReports field to DESCRIPTION",
  check = function(state) state$desc$has_fields('BugReports')
)

# run the two checks with their corresponding prep step
gp(pkg_path, checks = c("url", "bugreports"),
   extra_preps = list("desc" = prep_desc),
   extra_checks = list("url" = check_url, "bugreports" = check_bugreports))

