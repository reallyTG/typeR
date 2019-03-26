## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----ex1-----------------------------------------------------------------
library("seplyr")

plan <- partition_mutate_qt(
  rand_a := rand(),
   choice_a := rand_a>=0.5, # first use of a new value 1
    a_1 := ifelse(choice_a, # first use of a new value 2
                  'treatment', 
                  'control'),
    a_2 := ifelse(choice_a, 
                  'control', 
                  'treatment'),
  rand_b := rand(),
   choice_b := rand_b>=0.5, # first use of a new value 3
    b_1 := ifelse(choice_b, # first use of a new value 4
                  'treatment', 
                  'control'),
    b_2 := ifelse(choice_b, 
                  'control', 
                  'treatment'),
  rand_c := rand(),
   choice_c := rand_c>=0.5, # first use of a new value 5
    c_1 := ifelse(choice_c, # first use of a new value 6
                  'treatment', 
                  'control'),
    c_2 := ifelse(choice_c, 
                  'control', 
                  'treatment'),
  rand_d := rand(),
   choice_d := rand_d>=0.5, # first use of a new value 7
    d_1 := ifelse(choice_d, # first use of a new value 8
                  'treatment', 
                  'control'),
    d_2 := ifelse(choice_d, 
                  'control', 
                  'treatment'),
  rand_e := rand(),
   choice_e := rand_e>=0.5, # first use of a new value 9
    e_1 := ifelse(choice_e, # first use of a new value 10
                  'treatment', 
                  'control'),
    e_2 := ifelse(choice_e, 
                  'control', 
                  'treatment')
  )

print(plan)

## ----exec, eval=FALSE----------------------------------------------------
#  res <- mutate_seb(d, plan)

## ----reuse---------------------------------------------------------------
plan <- partition_mutate_qt(
  rand := rand(),
   choice := rand>=0.5, # first use of a new value 1
    a_1 := ifelse(choice, # first use of a new value 2
                  'treatment', 
                  'control'),
    a_2 := ifelse(choice, 
                  'control', 
                  'treatment'),
  rand := rand(),
   choice := rand>=0.5, # first use of a new value 3
    b_1 := ifelse(choice, # first use of a new value 4
                  'treatment', 
                  'control'),
    b_2 := ifelse(choice, 
                  'control', 
                  'treatment'),
  rand := rand(),
   choice := rand>=0.5, # first use of a new value 5
    c_1 := ifelse(choice, # first use of a new value 6
                  'treatment', 
                  'control'),
    c_2 := ifelse(choice, 
                  'control', 
                  'treatment'),
  rand := rand(),
   choice := rand>=0.5, # first use of a new value 7
    d_1 := ifelse(choice, # first use of a new value 8
                  'treatment', 
                  'control'),
    d_2 := ifelse(choice, 
                  'control', 
                  'treatment'),
  rand := rand(),
   choice := rand>=0.5, # first use of a new value 9
    e_1 := ifelse(choice, # first use of a new value 10
                  'treatment', 
                  'control'),
    e_2 := ifelse(choice, 
                  'control', 
                  'treatment')
  )

print(plan)

