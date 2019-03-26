library(exams)


### Name: exams2blackboard
### Title: Generation of Exams in Blackboard Format
### Aliases: exams2blackboard make_itembody_blackboard
### Keywords: utilities

### ** Examples

## load package and enforce par(ask = FALSE)
library("exams")
options(device.ask.default = FALSE)

## define an exams (= list of exercises)
myexam <- list(
  "boxplots",
  "ttest",
  "anova",
  "scatterplot",
  "relfreq"
)

## output directory
mydir <- tempdir()

## generate .zip with Blackboard exam in temporary directory
exams2blackboard(myexam, n = 3, dir = mydir)
dir(mydir)



