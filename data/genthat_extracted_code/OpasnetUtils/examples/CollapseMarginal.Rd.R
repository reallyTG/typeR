library(OpasnetUtils)


### Name: CollapseMarginal
### Title: Collapse marginals
### Aliases: CollapseMarginal

### ** Examples

test <- Ovariable("test", output = data.frame(City = c("Helsinki", "Espoo"), 
    Iter = 1, testResult = 1:2), marginal = c(TRUE, TRUE, FALSE))
CollapseMarginal(test, "City", "mean")



