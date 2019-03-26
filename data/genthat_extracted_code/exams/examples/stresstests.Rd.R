library(exams)


### Name: stresstest_exercise
### Title: Stress Testing Exercises
### Aliases: stresstest_exercise stresstest plot.stress
### Keywords: utilities

### ** Examples

## Not run: 
##D ## Stress testing.
##D t1 <- stresstest_exercise("tstat.Rnw", n = 100)
##D t2 <- stresstest_exercise("tstat2.Rnw", n = 100)
##D 
##D ## Plotting.
##D plot(t1, type = "overview")
##D plot(t1, type = "solution")
##D plot(t1, type = "solution", threshold = 30)
##D plot(t2, type = "rank")
##D plot(t2, type = "runtime")
##D 
##D ## For custom inspection, object can be
##D ## transformed to a data.frame.
##D head(as.data.frame(t2))
##D 
##D ## Multiple testing.
##D files <- list(
##D   "boxplots",
##D   c("tstat", "ttest", "confint"),
##D   c("regression", "anova"),
##D   "scatterplot",
##D   "relfreq"
##D )
##D t3 <- stresstest_exercise(files, n = 100)
##D plot(t3)
## End(Not run)



