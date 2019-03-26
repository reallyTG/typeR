## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE----------------------------------------------------------
#  library(future)
#  library(tidyqwi)
#  library(purrr)
#  library (plyr)

## ----eval=FALSE----------------------------------------------------------
#  year <- c("2008", "2009", "2010","2011")
#  state <- c("01","02","04","05","06","08","09","10","11","12",
#             "13","15","16","17","18","19","20","21","22","23",
#             "24","25","26","27","28","29","30","31","32","33",
#             "34","35","36","37","38","39","40","41","42","44",
#             "45","46","47","48","49","50","51","53","54","55",
#             "56")
#  
#  argList <- list(x = state, y = year)
#  
#  arguments <- cross_df(argList)

## ----eval=FALSE----------------------------------------------------------
#  plan("multiprocess")
#  
#  qwi_data <- map2(arguments$x, arguments$y, ~
#                    get_qwi(
#                      states = .x,
#                      years  = .y ,
#                      industry_level = "2",
#                      all_groups = FALSE,
#                      endpoint = "se",
#                      geography = "cbsa",
#                      processing = "multiprocess",
#                      apikey = APIkey))

## ----eval = FALSE--------------------------------------------------------
#  qwi_data <- ldply (qwi_data, data.frame)
#  

## ----eval=FALSE----------------------------------------------------------
#  qwi_data <- add_qwi_labels(qwi_data)

