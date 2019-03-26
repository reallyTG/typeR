library(runner)


### Name: fill_run
### Title: Fill NA with previous non-NA element
### Aliases: fill_run

### ** Examples

fill_run(c(NA,NA,1:10, NA, NA), run_for_first=TRUE)
fill_run(c(NA,NA,1:10, NA, NA), run_for_first=TRUE)
fill_run(c(NA,NA,1:10, NA, NA), run_for_first=FALSE)
fill_run(c(NA,NA,1,2,NA,NA,2,2,NA,NA,1, NA, NA), run_for_first=TRUE,only_within = TRUE)



