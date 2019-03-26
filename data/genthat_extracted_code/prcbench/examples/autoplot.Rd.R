library(prcbench)


### Name: autoplot.evalcurve
### Title: Plot the result of Precision-Recall curve evaluation
### Aliases: autoplot.evalcurve

### ** Examples

library(ggplot2)

## Plot evaluation results on test datasets r1, r2, and r3
testset <- create_testset("curve", c("c1", "c2", "c3"))
toolset <- create_toolset(set_names = "crv5")
eres1 <- run_evalcurve(testset, toolset)
autoplot(eres1)




