## ----knitr-setup, include=FALSE------------------------------------------
init_wd <- getwd()
knitr::opts_chunk$set(echo = TRUE, comment = "#>")
knitr::opts_knit$set(root.dir = tempdir(check = TRUE))
pacman::p_load(testthat, exampletestr, stringr)

## ----setup, results='hide'-----------------------------------------------
usethis::create_package("tempkg", open = FALSE)
file.copy(
  system.file("extdata", c("detect.R", "match.R"), package = "exampletestr"), 
  rprojroot::find_root_file(
    "tempkg/R/", 
    criterion = rprojroot::has_dir("tempkg")
  )
)

## ----fake-dir-change, eval=FALSE-----------------------------------------
#  setwd(
#    rprojroot::find_root_file(
#      "tempkg/",
#      criterion = rprojroot::has_dir("tempkg")
#    )
#  )

## ----further-knitr-setup, include=FALSE----------------------------------
knitr::opts_knit$set(root.dir = paste0(tempdir(), "/", "tempkg"))

## ----Look at match.R file, eval=FALSE------------------------------------
#  #' Detect the presence or absence of a pattern in a string.
#  #'
#  #' Vectorised over `string` and `pattern`.
#  #'
#  #' @param string Input vector. Either a character vector, or something
#  #'  coercible to one.
#  #' @param pattern Pattern to look for.
#  #'
#  #' @return A logical vector.
#  #'
#  #' @export
#  #' @examples
#  #' fruit <- c("apple", "banana", "pear", "pinapple")
#  #' str_detect(fruit, "a")
#  #' str_detect(fruit, "^a")
#  #' str_detect(fruit, "a$")
#  #' str_detect(fruit, "b")
#  #' str_detect(fruit, "[aeiou]")
#  #'
#  str_detect <- function(string, pattern) {
#    switch(type(pattern),
#           empty = ,
#           bound = str_count(string, pattern) > 0,
#           fixed = stri_detect_fixed(string, pattern, opts_fixed = opts(pattern)),
#           coll  = stri_detect_coll(string,  pattern, opts_collator = opts(pattern)),
#           regex = stri_detect_regex(string, pattern, opts_regex = opts(pattern))
#    )
#  }

## ----make_test_shell_fun, eval=FALSE-------------------------------------
#  make_test_shell_fun("str_detect", open = FALSE)

## ----test-utils.R contents, eval=FALSE-----------------------------------
#  context("`str_detect()`")
#  
#  test_that("`str_detect()` works", {
#    fruit <- c("apple", "banana", "pear", "pinapple")
#    expect_equal(str_detect(fruit, "a"), )
#    expect_equal(str_detect(fruit, "^a"), )
#    expect_equal(str_detect(fruit, "a$"), )
#    expect_equal(str_detect(fruit, "b"), )
#    expect_equal(str_detect(fruit, "[aeiou]"), )
#    expect_equal(str_detect("aecfg", letters), )
#  })

## ----fill in test shell--------------------------------------------------
context("`str_detect()`")

test_that("`str_detect()` works", {
  fruit <- c("apple", "banana", "pear", "pinapple")
  expect_equal(str_detect(fruit, "a"), rep(TRUE, 4))
  expect_equal(str_detect(fruit, "^a"), c(TRUE, rep(FALSE, 3)))
  expect_equal(str_detect(fruit, "a$"), c(FALSE, TRUE, FALSE, FALSE))
  expect_equal(str_detect(fruit, "b"), c(FALSE, TRUE, FALSE, FALSE))
  expect_equal(str_detect(fruit, "[aeiou]"), rep(TRUE, 4))
  expect_equal(str_detect("aecfg", letters), 
               letters %in% c("a", "c", "e", "f", "g"))
})

## ----setdown, include=FALSE----------------------------------------------
knitr::opts_knit$set(root.dir = tempdir(check = TRUE))
if (dir.exists("tempkg")) filesstrings::dir.remove("tempkg")
knitr::opts_knit$set(root.dir = init_wd)

