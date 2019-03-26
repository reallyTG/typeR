## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----eval = FALSE--------------------------------------------------------
#  install.packages("motoRneuron")
#  install.pacakges("devtools")
#  devtools::install_github("tweedell/motoRneuron")

## ----results = "hide", message=FALSE, warning=FALSE----------------------
library(motoRneuron)
library(ggplot2)

## ----eval = FALSE--------------------------------------------------------
#  ?motoRneuron
#  ?mu_synch

## ------------------------------------------------------------------------
motor_unit_data <- motoRneuron::motor_unit_data
head(motor_unit_data)


## ------------------------------------------------------------------------
motor_unit_1 <- data.frame(Time = motor_unit_data[["Time"]], MotorUnit1 = motor_unit_data[[2]])
motor_unit_1 <- subset(motor_unit_1, MotorUnit1 ==1) 
motor_unit_1 <- as.vector(motor_unit_1$Time)
motor_unit_2 <- data.frame(Time = motor_unit_data[["Time"]], MotorUnit2 = motor_unit_data[[3]])
motor_unit_2 <- subset(motor_unit_2, MotorUnit2 ==1)
motor_unit_2 <- as.vector(motor_unit_2$Time)

## ------------------------------------------------------------------------
head(motor_unit_1)
head(motor_unit_2)

## ----echo = FALSE, out.width='100%'--------------------------------------
knitr::include_graphics("Recurrence_intervals.jpg")

## ------------------------------------------------------------------------
recur <- recurrence_intervals(motor_unit_1, motor_unit_2, order = 2)
names(recur)

## ------------------------------------------------------------------------
recur$'Reference_Unit'
recur$Mean_Reference_ISI
recur$Number_of_Event_Discharges
head(recur$'1')

## ------------------------------------------------------------------------
recur <- unlist(recur$`1`)
binned_data <- bin(recur, binwidth = 0.001)

## ------------------------------------------------------------------------
subset(binned_data, Bin >= -0.015 & Bin <= 0.015)

## ----out.width='100%'----------------------------------------------------
plot_bins(binned_data)

## ----eval = FALSE--------------------------------------------------------
#  synch_data <- mu_synch(motor_unit_1, motor_unit_2, method = c("Visual", "Cumsum", "Zscore"), order = 1, binwidth = 0.001, plot = F)

## ----echo = FALSE, results = "hide", message=FALSE, warning=FALSE--------
synch_data <- mu_synch(motor_unit_1, motor_unit_2, method = c("Cumsum", "Zscore"), order = 1, binwidth = 0.001, plot = F)

## ----eval = FALSE--------------------------------------------------------
#  names(synch_data)

## ----eval = FALSE--------------------------------------------------------
#  synch_data$`Visual Indices`

## ------------------------------------------------------------------------
synch_data$`Zscore Indices`

## ------------------------------------------------------------------------
synch_data$`Cumsum Indices`

## ----echo = FALSE--------------------------------------------------------
knitr::include_graphics("Dygraph_Cumulative_Sum_Graph.png")

## ----eval = FALSE--------------------------------------------------------
#  visual_mu_synch(motor_unit_1, motor_unit_2, order = 1, binwidth = 0.001, get_data = T, plot = F)

## ----eval = FALSE--------------------------------------------------------
#  cumsum_mu_synch(motor_unit_1, motor_unit_2, order = 1, binwidth = 0.001, get_data = T, plot = F)

## ----eval = FALSE--------------------------------------------------------
#  zscore_mu_synch(motor_unit_1, motor_unit_2, order = 1, binwidth = 0.001, get_data = T, plot = F)

