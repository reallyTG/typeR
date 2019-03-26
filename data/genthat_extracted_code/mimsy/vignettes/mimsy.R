## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(mimsy)
library(knitr)

## ----install.packages, eval = FALSE--------------------------------------
#  # Install the devtools package
#  install.packages("devtools")
#  
#  # Load devtools
#  library(devtools)
#  
#  # Download mimsy from github using devtools
#  install_github("michelleckelly/mimsy", dependencies = "Depends")

## ----library, eval = FALSE-----------------------------------------------
#  # Load mimsy
#  library(mimsy)

## ----load.csv, eval = TRUE-----------------------------------------------
# Load data into R
data <- read.csv(file = "data.csv", header = TRUE, stringsAsFactors = FALSE)

# Check out the structure
str(data, vec.len = 2)

## ----run, eval = TRUE, warning=FALSE-------------------------------------
# Run the function
results <- mimsy(data, baromet.press = 977.2, units = "hPa")

## ----results-------------------------------------------------------------
# Check out the structure of the output
summary(results)

# See the summarized results dataframe
str(results$results, give.attr = FALSE)

## ----save, eval = FALSE--------------------------------------------------
#  # Save output to an Excel workbook
#  mimsy.save(results, file = "results.xlsx")
#  
#  # Save output to an RData file
#  save(results, file = "results.RData")

## ----fullScript, eval=FALSE----------------------------------------------
#  # Install the devtools package
#  install.packages("devtools")
#  # Load devtools
#  library(devtools)
#  # Download mimsy from Github using devtools
#  install_github("michelleckelly/mimsy", dependencies = "Depends")
#  
#  # Load mimsy
#  library(mimsy)
#  
#  # Load data into R
#  data <- read.csv(file = "data.csv", header = TRUE, stringsAsFactors = FALSE)
#  
#  # Run the mimsy function
#  results <- mimsy(data, baromet.press = 977.2, units = "hPa")
#  
#  # Save the results
#  mimsy.save(results, file = "results.xlsx") # To Excel file
#  save(results, file = "results.RData") # To RData file
#  
#  # Done! :)

