## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval=F-------------------------------------------------------------
#  if(!require(devtools)) {
#  install.packages("devtools")
#  }
#  
#  devtools::install_github('jooyoungseo/ezpickr')

## ---- eval=F-------------------------------------------------------------
#  install.packages("ezpickr")

## ----example1, eval=F----------------------------------------------------
#  library(ezpickr)
#  
#  # Choosing file and saving it into a variable
#  ## Scenario 1: Picking up a file using interactive GUI dialog box:
#  data <- pick() ## Please use `picko()` instead if your path/file contains any Korean characters.
#  
#  ## Scenario 2: Picking up a file using an explicit file name ("test.sav" in the example below; however, you can feed other files through this function such as *.SAS, *.DTA, *.csv, *.csv2, *.tsv, *.xlsx, *.txt, *.html, webpage URL, *.json, *.Rda, *.Rdata, and more):
#  data <- pick("test.sav") ## Please use `picko("test.sav")` instead if your path/file contains any Korean characters.
#  
#  # Now you can use the imported file as a tibble data frame.
#  str(data)

## ----example2, eval=F----------------------------------------------------
#  library(ezpickr)
#  
#  data(airquality)
#  str(airquality)
#  
#  # Use `viewxl()` function to open your data object in your spreadsheet:
#  viewxl(airquality)
#  # Then, when necessary, you can modify the opened data in the spreadsheet and save it as a new data.
#  
#  # You can pass a list object to the `viewxl()` function like below:
#  l <- list(iris = iris, mtcars = mtcars, chickwts = chickwts, quakes = quakes)
#  viewxl(l)
#  # Then, each list item will appear in your Excel window sheet by sheet.

