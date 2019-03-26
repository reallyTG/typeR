library(tableone)


### Name: CreateCatTable
### Title: Create an object summarizing categorical variables
### Aliases: CreateCatTable

### ** Examples


## Load
library(tableone)

## Load Mayo Clinic Primary Biliary Cirrhosis Data
library(survival)
data(pbc)
## Check variables
head(pbc)

## Create an overall table for categorical variables
catVars <- c("status","ascites","hepato","spiders","edema","stage")
catTableOverall <- CreateCatTable(vars = catVars, data = pbc)

## Simply typing the object name will invoke the print.CatTable method,
## which will show the sample size, frequencies and percentages.
## For 2-level variables, only the higher level is shown for simplicity
## unless the variables are specified in the cramVars argument.
catTableOverall

## If you need to show both levels for some 2-level factors, use cramVars
print(catTableOverall, cramVars = "hepato")

## Use the showAllLevels argument to see all levels for all variables.
print(catTableOverall, showAllLevels = TRUE)

## You can choose form frequencies ("f") and/or percentages ("p") or both.
## "fp" frequency (percentage) is the default. Row names change accordingly.
print(catTableOverall, format = "f")
print(catTableOverall, format = "p")

## To further examine the variables, use the summary.CatTable method,
## which will show more details.
summary(catTableOverall)

## The table can be stratified by one or more variables
catTableBySexTrt <- CreateCatTable(vars = catVars,
                                   strata = c("sex","trt"), data = pbc)

## print now includes p-values which are by default calculated by chisq.test.
## It is formatted at the decimal place specified by the pDigits argument
## (3 by default). It is formatted like <0.001 if very small.
catTableBySexTrt

## The exact argument toggles the p-values to the exact test result from
## fisher.test. It will show which ones are from exact tests.
print(catTableBySexTrt, exact = "ascites")

## summary now includes both types of p-values
summary(catTableBySexTrt)

## If your work flow includes copying to Excel and Word when writing manuscripts,
## you may benefit from the quote argument. This will quote everything so that
## Excel does not mess up the cells.
print(catTableBySexTrt, exact = "ascites", quote = TRUE)

## If you want to center-align values in Word, use noSpaces option.
print(catTableBySexTrt, exact = "ascites", quote = TRUE, noSpaces = TRUE)




