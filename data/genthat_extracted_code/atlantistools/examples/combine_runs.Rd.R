library(atlantistools)


### Name: combine_runs
### Title: This function is used to combine model output from different
###   simulations!
### Aliases: combine_runs

### ** Examples

outs <- list(preprocess, preprocess)
runs <- c("run1", "run2")
test <- combine_runs(outs, runs)
names(test[[1]])
head(test[[1]])



