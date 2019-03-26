library(exams)


### Name: read_exercise
### Title: Reading LaTeX/Markdown Exercise Files
### Aliases: read_exercise extract_command extract_extra
###   extract_environment extract_items read_metainfo
### Keywords: utilities

### ** Examples

## xexams() uses read_exercise() by default to read in
## each individual exercise, e.g., here for only a single
## exam with only a single exercise the result is:
set.seed(1090)
xexams("tstat.Rnw")[[1]][[1]]

## the corresponding Markdown version has:
set.seed(1090)
xexams("tstat.Rmd")[[1]][[1]]



