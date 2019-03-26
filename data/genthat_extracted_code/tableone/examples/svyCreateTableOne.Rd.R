library(tableone)


### Name: svyCreateTableOne
### Title: Create an object summarizing both continuous and categorical
###   variables for weighted data
### Aliases: svyCreateTableOne

### ** Examples


## Load packages
library(tableone)
library(survey)

## Create a weighted survey design object
data(nhanes)
nhanesSvy <- svydesign(ids = ~ SDMVPSU, strata = ~ SDMVSTRA, weights = ~ WTMEC2YR,
                       nest = TRUE, data = nhanes)

## Create a table object
## factorVars are converted to factors; no need for variables already factors
## strata will stratify summaries; leave it unspecified for overall summaries
tab1 <- svyCreateTableOne(vars = c("HI_CHOL","race","agecat","RIAGENDR"),
                          strata = "RIAGENDR", data = nhanesSvy,
                          factorVars = c("race","RIAGENDR"))

## Detailed output
summary(tab1)

## Default formatted printing
tab1

## nonnormal specifies variables to be shown as median [IQR]
print(tab1, nonnormal = "HI_CHOL", contDigits = 3, catDigits = 2,
      pDigits = 4, smd = TRUE)

## minMax changes it to median [min, max]
print(tab1, nonnormal = "HI_CHOL", minMax = TRUE, contDigits = 3,
      catDigits = 2, pDigits = 4, smd = TRUE)

## showAllLevels can be used tow show levels for all categorical variables
print(tab1, showAllLevels = TRUE, smd = TRUE)

## To see all printing options
?print.TableOne

## To examine categorical variables only
tab1$CatTable

## To examine continuous variables only
tab1$ContTable

## If SMDs are needed as numericals, use ExtractSmd()
ExtractSmd(tab1)




