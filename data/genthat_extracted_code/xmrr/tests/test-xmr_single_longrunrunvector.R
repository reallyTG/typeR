context("Shortrun Tests")

library(testthat)
library(xmrr)
library(dplyr)
library(tidyr)



int_test <- 18

y2 <- 2000 + int_test

Year <- seq(2001, y2, 1)
Measure <-  Measure <- c(59, 53, 56, 52, 58, 55, 58, 52, 52, 
                         51, 53, 51, 51, 52, 55, 54, 56, 54)
# 
# data.frame(Year, Measure) %>% 
#   xmr("Measure", recalc = T, testing = T, longrun = 8) %>% 
#   xmr_chart("Year", "Measure") + 
#   geom_text(aes(y = Measure, label = Measure))


test_that("Modified/Single Longrun works right", {
  df <- data.frame(Year, Measure) %>% 
    xmr(., "Measure", recalc = T, longrun = 7)
  point <- df$`Upper Natural Process Limit`[8]
  last <- df$`Upper Natural Process Limit`[14]
  max <- max(point - last, na.rm = T)
  expect_lt(max, 0.01)
})

test_that("Modified/Multiple Longrun works right", {
  df <- data.frame(Year, Measure) %>% 
    xmr(., "Measure", recalc = T, longrun = c(5,7))
  point <- df$`Upper Natural Process Limit`[8]
  last <- df$`Upper Natural Process Limit`[14]
  max <- max(point - last, na.rm = T)
  expect_lt(max, 0.01)
})


test_that("Regular/Single Longrun works right", {
  df <- data.frame(Year, Measure) %>% 
    xmr(., "Measure", recalc = T, longrun = 8)
  point <- df$`Upper Natural Process Limit`[8]
  last <- df$`Upper Natural Process Limit`[18]
  max <- max(point - last, na.rm = T)
  expect_lt(max, 0.01)
})

test_that("Regular/Multiple Longrun works right", {
  df <- data.frame(Year, Measure) %>% 
    xmr(., "Measure", recalc = T, longrun = c(5,8))
  point <- df$`Upper Natural Process Limit`[8]
  last <- df$`Upper Natural Process Limit`[18]
  max <- max(point - last, na.rm = T)
  expect_lt(max, 0.01)
})



