## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----use1----------------------------------------------------------------
library("wrapr")

5 %.>% sin(.)

## ----nofn----------------------------------------------------------------
5 %.>% sin
5 %.>% base::sin 

## ----sinfn---------------------------------------------------------------
function_reference <- list(f = sin)
class(function_reference) <- c("wrapr_applicable", "ourclass")

apply_right.ourclass <- function(pipe_left_arg,
                                 pipe_right_arg,
                                 pipe_environment,
                                 left_arg_name,
                                 pipe_string,
                                 right_arg_name) {
  pipe_right_arg$f(pipe_left_arg)
}

function_reference

5 %.>% function_reference

function_reference$f <- sqrt
5 %.>% function_reference

## ----debug---------------------------------------------------------------
apply_right.ourclass <- function(pipe_left_arg,
                                 pipe_right_arg,
                                 pipe_environment,
                                 left_arg_name,
                                 pipe_string,
                                 right_arg_name) {
  print("pipe_left_arg")
  print(pipe_left_arg)
  print("pipe_right_arg")
  print(pipe_right_arg)
  print("pipe_environment")
  print(pipe_environment)
  print("left_arg_name")
  print(left_arg_name)
  print("pipe_string")
  print(pipe_string)
  print("right_arg_name")
  print(right_arg_name)
  pipe_right_arg$f(pipe_left_arg)
}

5 %.>% function_reference

a <- 5

a %.>% function_reference

