options(scipen=999)
library(matchbook)
library(testthat)
# library(RUnit)
# library(devtools)

############################################################################### 
############################################################################### 
############################################### get user details lcoally
username <- scan(file="~/mb_user_name.txt",what="raw")
password  <- scan(file="~/mb_pwd.txt",what="raw")

############################################################################### 
############################################################################### 
############################################### login
### this is a unit test for the login function
session_details <- mb_login(username,password)

test_that("Login works OK", {
  expect_equal(session_details$status_code, 200)
})

############################################################################### 
############################################################################### 
############################################### logout
### this is a unit test for the logout function
log_out <- mb_logout(session_details)
test_that("Logout works OK", {
  expect_equal(log_out$status_code, 200)
})

############################################################################### 
############################################################################### 
############################################### logout
### this is a unit test for the get_currencies function
session_details <- mb_login(username,password)
currencies      <- mb_get_currencies(session_details)
test_that("get_currencies gets USD id ok", {
  expect_equal(currencies$`short-name`[which(currencies$`currency-id`==1)], "USD")
})



############################################### logout
### clear workspace
rm(list = ls())
