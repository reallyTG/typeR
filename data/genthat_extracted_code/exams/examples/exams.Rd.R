library(exams)


### Name: exams
### Title: Generation of Simple Exams
### Aliases: exams print.exams_metainfo
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
  "scatterplot",
  "relfreq"
)

if(interactive()) {
## compile a single random exam (displayed on screen)
sol <- exams(myexam)
sol
}

## generate multiple exams (stored in output directory)
odir <- tempfile()
sol <- exams(myexam, n = 3, dir = odir, template = c("exam", "solution"))
sol

## inspect solution for a particular exam
print(sol, 3)

if(interactive()) {
## modify control argument for printing
mymchoice.control <- list(mchoice.print = list(True = LETTERS[1:5], False = "_"))
sol <- exams("boxplots", template = "solution",
  control = mymchoice.control)
sol
}



