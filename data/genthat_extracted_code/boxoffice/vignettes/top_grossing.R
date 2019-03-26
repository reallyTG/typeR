## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
# America
movies <- boxoffice::top_grossing(type = "American")
head(movies)

## ------------------------------------------------------------------------
# International
movies <- boxoffice::top_grossing(type = "international")
head(movies)

## ------------------------------------------------------------------------
# Worldwide
movies <- boxoffice::top_grossing(type = "worldwide")
head(movies)

## ------------------------------------------------------------------------
movies <- boxoffice::top_grossing()
head(movies)

## ------------------------------------------------------------------------
# 
movies <- boxoffice::top_grossing(ranks = 1)
head(movies)

## ------------------------------------------------------------------------
# Worldwide
movies <- boxoffice::top_grossing(ranks = c(1000, 34, 1, 55, 64))
head(movies)

