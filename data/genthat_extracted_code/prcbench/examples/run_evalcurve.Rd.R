library(prcbench)


### Name: run_evalcurve
### Title: Evaluate Precision-Recall curves with specified tools and test
###   sets
### Aliases: run_evalcurve

### ** Examples

## Evaluate curves for c1, c2, c3 test sets and crv5 tool set
testset <- create_testset("curve", c("c1", "c2", "c3"))
toolset <- create_toolset(set_names = "crv5")
res1 <- run_evalcurve(testset, toolset)
res1




