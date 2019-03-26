## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
movies <- boxoffice::boxoffice(date = as.Date("2015-10-31"))
dim(movies)
movies[1:5, ]

## ------------------------------------------------------------------------
mojo <- boxoffice::boxoffice(dates = as.Date("2015-10-31"), 
                             site = "mojo", top_n = 10)
numbers <- boxoffice::boxoffice(dates = as.Date("2015-10-31"),
                             site = "numbers", top_n = 10)
cbind(mojo[, c(1,3)], numbers[, c(1,3)])

