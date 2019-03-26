library(ezpickr)


### Name: picko
### Title: Choosing any rectangular Korean data file using interactive GUI
###   dialog box.
### Aliases: picko
### Keywords: picko

### ** Examples

# Choosing file and saving it into a variable
## Scenario 1: Picking up a file using interactive GUI dialog box:
if(interactive()) {
  library(ezpickr)
  data <- picko()
}

## Scenario 2: Picking up a file using an explicit file name ("test.sav" in the example below;
## however, you can feed other files through this function
## such as *.SAS, *.DTA, *.csv, *.csv2, *.tsv, *.xlsx, *.txt,
## *.html, webpage URL, *doc, *.docx, *.pdf, *.rtf, *.json, *.Rda, *.Rdata, and more):
if(interactive()) {
library(ezpickr)
test <- system.file("extdata", "airquality.sav", package = "ezpickr")
data <- picko(test)

# Now you can use the imported file as a tibble.
str(data)
}



