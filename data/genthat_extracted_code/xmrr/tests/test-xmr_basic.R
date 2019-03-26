

library(testthat)
library(xmrr)
library(dplyr)
library(tidyr)



int_test <- 100

y2 <- 2000 + int_test

Year <- seq(2001, y2, 1)
Measure <-  runif(length(Year))*100 %>% round(0) %>% as.integer()



#recalc = F
basictest <- function(recalc, reuse){
  for (i in 3:int_test){
   interval <- i
    df <- data.frame(Year, Measure) %>% 
      xmr("Measure", recalc = recalc, interval = interval, reuse = reuse)
  
    test_that("Central Line calculation is correct", {
      cl <- df$`Central Line`[1]
      cl_c <- mean(df$Measure[1:interval])
      expect_lt(cl-cl_c, 0.01)
    })

    test_that("Average Moving Range calculation is correct", {
      avm <- df$`Average Moving Range`[2]
      mv <- mean(df$`Moving Range`[2:interval])
      expect_lt(avm - mv, 0.01)
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
  }
}

basictest(recalc = T, reuse = T)
basictest(recalc = T, reuse = F)
basictest(recalc = F, reuse = T)
basictest(recalc = F, reuse = F)
