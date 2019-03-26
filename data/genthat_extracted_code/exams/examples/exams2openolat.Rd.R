library(exams)


### Name: exams2openolat
### Title: Generation of Exams for OpenOLAT
### Aliases: exams2openolat
### Keywords: utilities

### ** Examples

## No test: 
## load package and enforce par(ask = FALSE)
library("exams")
options(device.ask.default = FALSE)

## define an exams (= list of exercises)
myexam <- list(
  "boxplots",
  c("tstat", "ttest", "confint"),
  c("regression", "anova"),
  c("scatterplot", "boxhist"),
  "relfreq"
)

## output directory
mydir <- tempdir()

## generate .zip with OpenOLAT test in temporary directory
exams2openolat(myexam, n = 3, dir = mydir)
dir(mydir)
## End(No test)



