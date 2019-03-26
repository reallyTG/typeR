library(tableone)


### Name: CreateTableOne
### Title: Create an object summarizing both continuous and categorical
###   variables
### Aliases: CreateTableOne

### ** Examples


## Load
library(tableone)

## Load Mayo Clinic Primary Biliary Cirrhosis Data
library(survival)
data(pbc)
## Check variables
head(pbc)

## Make categorical variables factors
varsToFactor <- c("status","trt","ascites","hepato","spiders","edema","stage")
pbc[varsToFactor] <- lapply(pbc[varsToFactor], factor)

## Create a variable list
dput(names(pbc))
vars <- c("time","status","age","sex","ascites","hepato",
          "spiders","edema","bili","chol","albumin",
          "copper","alk.phos","ast","trig","platelet",
          "protime","stage")

## Create Table 1 stratified by trt
tableOne <- CreateTableOne(vars = vars, strata = c("trt"), data = pbc)

## Just typing the object name will invoke the print.TableOne method
tableOne

## Specifying nonnormal variables will show the variables appropriately,
## and show nonparametric test p-values. Specify variables in the exact
## argument to obtain the exact test p-values. cramVars can be used to
## show both levels for a 2-level categorical variables.
print(tableOne, nonnormal = c("bili","chol","copper","alk.phos","trig"),
      exact = c("status","stage"), cramVars = "hepato", smd = TRUE)

## Use the summary.TableOne method for detailed summary
summary(tableOne)

## See the categorical part only using $ operator
tableOne$CatTable
summary(tableOne$CatTable)

## See the continuous part only using $ operator
tableOne$ContTable
summary(tableOne$ContTable)

## If your work flow includes copying to Excel and Word when writing manuscripts,
## you may benefit from the quote argument. This will quote everything so that
## Excel does not mess up the cells.
print(tableOne, nonnormal = c("bili","chol","copper","alk.phos","trig"),
      exact = c("status","stage"), quote = TRUE)

## If you want to center-align values in Word, use noSpaces option.
print(tableOne, nonnormal = c("bili","chol","copper","alk.phos","trig"),
      exact = c("status","stage"), quote = TRUE, noSpaces = TRUE)

## If SMDs are needed as numericals, use ExtractSmd()
ExtractSmd(tableOne)




