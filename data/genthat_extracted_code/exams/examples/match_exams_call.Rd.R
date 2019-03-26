library(exams)


### Name: match_exams_call
### Title: Query Information from Last xexams/exams2xyz Call
### Aliases: match_exams_call match_exams_device
### Keywords: utilities

### ** Examples

## call exams2nops
tdir <- tempdir()
exams2nops("tstat2.Rnw", dir = tdir)
match_exams_call()

## graphics device used
match_exams_device()

## exams2nops called exams2pdf called xexams:
match_exams_call(which = NULL)

## get full exams2nops call
match_exams_call(deparse = FALSE)

## but note that convenience wrappers etc. are included
e2n <- function(...) exams2nops(...)
e2n("tstat2.Rnw", dir = tdir)
match_exams_call(which = NULL)



