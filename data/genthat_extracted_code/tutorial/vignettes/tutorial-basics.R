## ---- include=FALSE------------------------------------------------------
tutorial::go_interactive()

## ------------------------------------------------------------------------
#  a <- 2
#  b <- 3

## ----ex="play_around", type="pre-exercise-code"--------------------------
#  c <- 4
#  library(stringr)

## ----ex="play_around", type="sample-code"--------------------------------
#  a <- 2
#  b <- 3

## ----ex="create_a", type="pre-exercise-code"-----------------------------
#  b <- 5

## ----ex="create_a", type="sample-code"-----------------------------------
#  # Create a variable a, equal to 5
#  
#  
#  # Print out a
#  

## ----ex="create_a", type="solution"--------------------------------------
#  # Create a variable a, equal to 5
#  a <- 5
#  
#  # Print out a
#  a

## ----ex="create_a", type="sct"-------------------------------------------
#  test_object("a")
#  test_output_contains("a", incorrect_msg = "Make sure to print out `a`.")
#  success_msg("Great!")

