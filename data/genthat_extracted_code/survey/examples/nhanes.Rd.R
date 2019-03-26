library(survey)


### Name: nhanes
### Title: Cholesterol data from a US survey
### Aliases: nhanes
### Keywords: datasets

### ** Examples

data(nhanes)
design <- svydesign(id=~SDMVPSU, strata=~SDMVSTRA, weights=~WTMEC2YR, nest=TRUE,data=nhanes)
design



