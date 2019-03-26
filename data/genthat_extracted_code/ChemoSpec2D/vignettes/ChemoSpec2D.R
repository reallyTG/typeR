## ----SetUp, echo = FALSE, eval = TRUE, results = "hide"----

# R options & configuration:
set.seed(9)
rm(list = ls())
suppressMessages(library("knitr"))
options(width =  30) # for pinp specifically (narrow cols)
desc <- packageDescription("ChemoSpec2D")

# Stuff specifically for knitr:
#opts_chunk$set(eval = FALSE)

