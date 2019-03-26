## ----setup, echo = FALSE, message = FALSE--------------------------------
knitr::opts_chunk$set(tidy = FALSE, comment = "#>")

## ----eval=FALSE----------------------------------------------------------
#  install.packages("timevis")

## ----eval=FALSE----------------------------------------------------------
#  install.packages("devtools")
#  devtools::install_github("daattali/timevis")

## ----eval=FALSE----------------------------------------------------------
#  library(timevis)
#  timevis()

## ----eval=FALSE----------------------------------------------------------
#  data <- data.frame(
#    id      = 1:4,
#    content = c("Item one"  , "Item two"  ,"Ranged item", "Item four"),
#    start   = c("2016-01-10", "2016-01-11", "2016-01-20", "2016-02-14 15:00:00"),
#    end     = c(NA          ,           NA, "2016-02-04", NA)
#  )
#  
#  timevis(data)

