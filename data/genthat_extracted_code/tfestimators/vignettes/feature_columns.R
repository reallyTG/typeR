## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, eval = FALSE)

## ------------------------------------------------------------------------
#  library(nycflights13)
#  print(flights)

## ------------------------------------------------------------------------
#  cols <- feature_columns(
#    column_numeric("dep_time"),
#    column_numeric("dep_delay")
#  )

## ------------------------------------------------------------------------
#  cols <- feature_columns(
#    column_numeric("dep_time", "dep_delay")
#  )

## ------------------------------------------------------------------------
#  library(nycflights13)
#  
#  cols <- feature_columns(names = flights,
#    column_numeric(ends_with("time"))
#  )

## ------------------------------------------------------------------------
#  cols <- with_columns(flights, {
#    feature_columns(
#      column_numeric(ends_with("time"))
#    )
#  })

## ------------------------------------------------------------------------
#  cols <- with_columns(flights, {
#    feature_columns(
#      ends_with("time") ~ column_numeric(),
#    )
#  })

