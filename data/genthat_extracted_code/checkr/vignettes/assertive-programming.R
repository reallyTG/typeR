## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- error = TRUE-------------------------------------------------------
height <- dplyr::starwars$height
stopifnot(is.character(height))

## ---- error = TRUE-------------------------------------------------------
my_fun <- function(x) stopifnot(is.character(x))
my_fun(height)

## ---- error=TRUE---------------------------------------------------------
library(assertthat)
assert_that(is.character(height))

## ---- error = TRUE-------------------------------------------------------
my_fun <- function(x) assert_that(is.character(x))
my_fun(dplyr::starwars$height)

## ---- error = TRUE-------------------------------------------------------
is.character2 <- function(x) is.character(x)
on_failure(is.character2) <- function(call, env) {
  paste0(deparse(call$x), " must be a character - sort it out!")
}
assert_that(is.character2(height))

## ---- echo = FALSE-------------------------------------------------------
detach("package:assertthat")

## ---- error = TRUE-------------------------------------------------------
library(checkmate)
assert_character(height)

## ---- error = TRUE-------------------------------------------------------
my_fun <- function(x) assert_character(x)
my_fun(height)

## ---- error = TRUE-------------------------------------------------------
assert(checkCharacter(height), checkFactor(height))

## ---- echo = FALSE-------------------------------------------------------
detach("package:checkmate")

## ---- error = TRUE-------------------------------------------------------
library(checkr)
check_vector(height, "")

## ---- error = TRUE-------------------------------------------------------
my_fun <- function(x) check_vector(x, "")
my_fun(height)

## ---- error = TRUE-------------------------------------------------------
checkor(check_vector(height, ""), check_vector(height, 1))

## ---- error = TRUE-------------------------------------------------------
my_fun <- function(x) check_vector(x, "", x_name = substitute(x))
my_fun(height)

