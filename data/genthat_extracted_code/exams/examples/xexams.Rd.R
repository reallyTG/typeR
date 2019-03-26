library(exams)


### Name: xexams
### Title: Extensible Generation of Exams
### Aliases: xexams exams_metainfo
### Keywords: utilities

### ** Examples

## define an exam with five exercises
myexam <- list(
  "boxplots",
  c("tstat", "ttest", "confint"),
  c("regression", "anova"),
  "scatterplot",
  "relfreq"
)

## run exams with default drivers (i.e., no transformations or writer)
x <- xexams(myexam, n = 2)
## x is a list of 2 exams,
## each of which contains 5 exercises,
## each of which contains LaTeX code for question(list) and solution(list),
## plus metainformation and potential supplements

## The first exercise in each exam is "boxplots", a multiple choice question.
## Its general question text is
x[[1]][[1]]$question
## with a list of multiple choice questions given as
x[[1]][[1]]$questionlist
## the corresponding graphic is in supplementary file
x[[1]][[1]]$supplements

## The metainformation is a list read for the \ex*{} items
x[[1]][[1]]$metainfo

## The metainformation can also be extracted/printed as
## in the old exams() (rather than xexams()) interface
exams_metainfo(x)



