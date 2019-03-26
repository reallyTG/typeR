library(exams)


### Name: exams2qti12
### Title: Generation of Exams in IMS QTI 1.2 and 2.1 Format
### Aliases: exams2qti12 make_itembody_qti12 exams2qti21
###   make_itembody_qti21 exams2qti make_itembody_qti exams2ilias
### Keywords: utilities

### ** Examples

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

## generate .zip with QTI 1.2 exam in temporary directory
## using a few customization options
exams2qti12(myexam, n = 3, dir = mydir,
  maxattempts = 3,
  num = list(digits = 1),
  mchoice = list(shuffle = TRUE, enumerate = FALSE)
)
dir(mydir)



