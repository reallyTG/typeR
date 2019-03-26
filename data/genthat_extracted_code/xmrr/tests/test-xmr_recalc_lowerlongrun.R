context("Calculate XMR Lower Long Run Recalculation")

library(testthat)
library(xmrr)
library(dplyr)
library(tidyr)



Measure <- c(58, 57, 69, 62, 66, 58, 66, 62,
             61, 51, 57, 58, 59, 50, 59, 58, 57, 59)
Time <- c(2000:2017) 
example_data <- data.frame(Time, Measure)

df <- xmr(example_data, measure = "Measure", recalc = T)


test_that("Upper shortrun recalculation is correct", {
  mv <- df$`Moving Range`[df$Order %in% c(8:12)] %>% mean()
  avm <-  df$`Average Moving Range`[11]
  calc <- avm - mv
  max <- max(calc, na.rm = T)
  expect_lt(max, 0.01)
  
  m <- df$Measure[df$Order %in% c(8:12)] %>% mean()
  cl <-  df$`Central Line`[11]
  calc <- m - cl
  max <- max(calc, na.rm = T)
  expect_lt(max, 0.01)
})


test_that("Upper Process Limit calculation is correct", {
  up <- df$`Upper Natural Process Limit` 
  calc <- (df$`Central Line` + (2.66 * df$`Average Moving Range`))
  max <- max(up - calc, na.rm = T)
  expect_lt(max, 0.01)
})

test_that("Lower Process Limit calculation is correct", {
  lower <- df$`Lower Natural Process Limit` 
  calc <- (df$`Central Line` - (2.66 * df$`Average Moving Range`))
  calc <- ifelse(calc < 0, 0, calc)
  max <- max(lower - calc, na.rm = T)
  expect_lt(max, 0.01)
})

