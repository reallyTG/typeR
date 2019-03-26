## ----install1, eval = FALSE----------------------------------------------
#  install.packages("NoiseFiltersR")

## ----install2------------------------------------------------------------
library(NoiseFiltersR)

## ----document1, eval=FALSE-----------------------------------------------
#  ?GE
#  help(GE)

## ----Calls---------------------------------------------------------------
data(iris)
str(iris)
# Using the default method:
out_Def <- edgeBoostFilter(iris, classColumn = 5)
# Using the formula method:
out_For <- edgeBoostFilter(Species~., iris)
# Checking that the filtered datasets are identical:
identical(out_Def$cleanData, out_For$cleanData)

## ----filterClass1--------------------------------------------------------
str(out_For)

## ----filterClass2--------------------------------------------------------
print(out_For)

## ----filterClass3--------------------------------------------------------
summary(out_For, explicit = TRUE)

