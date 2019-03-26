context("Calculate XMR Short Run Recalculation")

library(testthat)
library(xmrr)
library(dplyr)
library(tidyr)



Measure <- c(58, 57, 69, 62, 66, 58, 66, 52, 51, 51, 87, 78, 99, 100, 89, 82, 95, 99)
Time <- c(2000:2017) 
example_data <- data.frame(Time, Measure)

df <- xmr(example_data, measure = "Measure", 
          recalc = T, shortrun = c(3,4))

#xmr_chart(df, 'Time', 'Measure') + geom_text(aes(y = Measure, label = Order))


test_that("Lower shortrun recalculation is correct", {
  mv <- df$`Moving Range`[df$Order %in% c(8, 9, 10)] %>% mean()
  avm <-  df$`Average Moving Range`[8]
  calc <- avm - mv
  max <- max(calc, na.rm = T)
  expect_lt(max, 0.01)
  
  m <- df$`Measure`[df$Order %in% c(8, 9, 10)] %>% mean()
  cl <-  df$`Central Line`[8]
  calc <- m-cl
  max <- max(calc, na.rm = T)
  expect_lt(max, 0.01)
})

test_that("Upper shortrun recalculation is correct", {
  mv <- df$`Moving Range`[df$Order %in% c(11, 12, 13)] %>% mean()
  avm <-  df$`Average Moving Range`[11]
  calc <- avm - mv
  max <- max(calc, na.rm = T)
  expect_lt(max, 0.01)
  
  m <- df$Measure[df$Order %in% c(11, 12, 13)] %>% mean()
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
