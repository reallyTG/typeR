## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----example1------------------------------------------------------------
require(plyr)
require(cleanerR)
z=GenerateCandidates(df=iris,goal=5,maxi=3,repetitions=100,trigger=0.0)
print(z[[1]])
cat("error rate\n")
print(z[[2]])

## ----example2------------------------------------------------------------
require(plyr)
require(cleanerR)
NA_VALUES(iris)

