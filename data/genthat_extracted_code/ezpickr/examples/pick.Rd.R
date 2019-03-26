library(ezpickr)


### Name: pick
### Title: Choosing any rectangular data file using interactive GUI dialog
###   box.
### Aliases: pick
### Keywords: pick

### ** Examples

# Choosing file and saving it into a variable
## Scenario 1: Picking up a file using interactive GUI dialog box:
if(interactive()) {
  library(ezpickr)
## Use either `pick(mode="ko1")` or `pick(mode="ko2")` for Korean R users.
  data <- pick() 
}

## Scenario 2: Picking up a file using an explicit file name ("test.sav" in the example below;
## however, you can feed other files through this function
## such as *.SAS, *.DTA, *.csv, *.csv2, *.tsv, *.xlsx, *.txt,
## *.html, webpage URL, *doc, *.docx, *.pdf, *.rtf, *.json, *.Rda, *.Rdata, and more):
library(ezpickr)
test <- system.file("extdata", "airquality.sav", package = "ezpickr")
## Use either `pick(test, mode="ko1")` or `pick(test, mode="ko2")` for Korean R users.
data <- pick(test)

# Now you can use the imported file as a tibble.
str(data)



