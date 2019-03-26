## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", fig.width = 7, fig.height = 7, fig.align = "center")
library(CrossVA)
library(openVA)

## ----setCWD, eval = FALSE------------------------------------------------
#  # Print the current working directory
#  getwd()
#  #> [1] "C:/Users/LeoMessi/"
#  
#  # Change your current working directory as follows
#  setwd("C:/Users/LeoMessi/Verbal-Autopsy")
#  getwd()
#  #> [1] "C:/Users/LeoMessi/Verbal-Autopsy"
#  
#  # Print the files in your current working directory with the dir() function
#  # (the CSV file you created with ODK Briefcase should be listed)
#  dir()
#  #> [1] "vaData_2016.csv"    "vaData_2012.csv" "rCode_for_cleaning_vaData.R"
#  #> [2] "vaData_report.pdf"  "cat_Videos"
#  
#  # Load data into R
#  odkexport <- read.csv("vaData_2016.csv", stringsAsFactors = FALSE)

## ----loadData, eval = FALSE----------------------------------------------
#  # Start by loading the CrossVA and openVA packages from your library
#  library(CrossVA)
#  library(openVA)
#  
#  # Load the CSV from ODK Briefcase (here we use the example data file from the CrossVA package)
#  ## fileNames_v151 contains the path to the example data file
#  fileName_v151 <- system.file("sample", "who151_odk_export.csv", package = "CrossVA")
#  fileName_v151
#  #> [1] "C:/Users/LeoMessi/R/win-library/3.5/CrossVA/sample/who151_va_output.csv"
#  
#  dir("C:/Users/LeoMessi/R/win-library/3.5/CrossVA/sample/")
#  #> [1] "who151_odk_export.csv"    "who141_odk_export.csv"    "who_va_output.csv"
#  
#  # Use the read.csv() function to load the data
#  odkexport_v151 <- read.csv(fileName_v151, stringsAsFactors = FALSE)

## ----silentLoadva151, include = FALSE------------------------------------
fileName_v151 <- system.file("sample", "who151_odk_export.csv", package = "CrossVA")
odkexport_v151 <- read.csv(fileName_v151, stringsAsFactors = FALSE)

## ----runCrossVA----------------------------------------------------------
# Convert VAs using the odk2openVA() function
## we will be able to use either InterVA5 or insilico(data.type = "WHO2016") to assign CoD
openva_input_v151 <- odk2openVA(odkexport_v151, version = "1.5.1")

# For 2016 WHO VA instrument, the output needs to have 354 columns (1 ID + 353 symptoms)
dim(openva_input_v151)

# ID must be the first column
names(openva_input_v151)

## ----InterVA5------------------------------------------------------------
# InterVA5
run1 <- InterVA5(openva_input_v151,
                 HIV = "l",
                 Malaria = "l",
                 write = TRUE,
                 directory = getwd())

# We could also use codeVA() to get the same results:
## run1 <- codeVA(openva_input_v151,
##                data.type = "WHO2016",
##                model = "InterVA",
##                version = "5.0",
##                HIV = "l",
##                Malaria = "l",
##                write = TRUE,
##                directory = getwd())

## ----InterVA5-summary----------------------------------------------------
# List the top 5 causes in the Cause-Specific Mortality Fraction (CSMF)
summary(run1)

# We can list more causes with the top parameter.
summary(run1, top = 10)

# Create a bar plot of the CSMF.
plotVA(run1)

# InterVA5 will also write an CSV file, called VA5_result.csv, with the CoDs for each record.
# Also note that InterVA5 created the log file, errorlogV5.txt
dir()

## ----InSilico------------------------------------------------------------
run2 <- insilico(openva_input_v151, data.type = "WHO2016")

## run2 <- codeVA(openva_input_v151,
##                data.type = "WHO2016",
##                model = "InSilico",
##                version = "WHO2016")

# Print CSMF for top 6 causes
summary(run2, top = 6)

# Plot CSMF
plotVA(run2)

## ----example141----------------------------------------------------------
# If you have not run the previous code, make sure you have loaded the packages
# library(CrossVA)
# library(openVA)
fileName_v141 <- system.file("sample", "who141_odk_export.csv", package = "CrossVA")
odkexport_v141 <- read.csv(fileName_v141, stringsAsFactors = FALSE)

# Convert VAs using the odk2openVA() function for version 1.4.1
## we will be able to use either InterVA5 or insilico(data.type = "WHO2016") to assign CoD
openva_input_v141 <- odk2openVA(odkexport_v141, version = "1.4.1")
dim(openva_input_v141)

# Assign CoD with model = InterVA5 and codeVA
run3 <- codeVA(openva_input_v141,
               data.type = "WHO2016",
               model = "InterVA",
               version = "5.0",
               HIV = "l",
               Malaria = "l",
               write = TRUE,
               directory = getwd())

## Summarize InterVA5 results
summary(run3)
plotVA(run3)

# Assign CoD with model = InSilico and codeVA
run4 <- codeVA(openva_input_v141,
               data.type = "WHO2016",
               model = "InSilicoVA")

## Summarize InSilicoVA results
summary(run4)
plotVA(run4)

