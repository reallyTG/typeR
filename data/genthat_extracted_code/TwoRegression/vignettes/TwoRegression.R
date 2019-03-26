## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(TwoRegression)
RAW <- system.file("extdata", "TestID_LeftWrist_RAW.csv", package = "TwoRegression")
IMU <- 
  system.file("extdata", "TestID_LeftWrist_IMU.csv", package = "TwoRegression") #Set this to NULL if no IMU file exists
Wear_Location <- "Left Wrist"
PID <- "Test"
Algorithm <- 3 #Will be automatically set to 1 if no IMU file is present
verbose <- FALSE
IMU_ignore_A1 <- TRUE

test_data <-
  hibbing18_twoReg_process(RAW, IMU, Wear_Location, PID, Algorithm, verbose, IMU_ignore_A1)

print(head(test_data))

## ------------------------------------------------------------------------
# RAW <- list.files(pattern = "RAW.csv", full.names = TRUE)
# IMU <- list.files(pattern = "IMU.csv", full.names = TRUE)
# PID <- paste("Test", seq(RAW), sep = "_")
# 
# test_data <-
#   mapply(
#   hibbing18_twoReg_process,
#   RAW = RAW,
#   IMU = IMU,
#   PID = PID,
#   MoreArgs = list(Wear_Location = "Left Wrist", Algorithm = c(1, 2)),
#   SIMPLIFY = FALSE
#   )

