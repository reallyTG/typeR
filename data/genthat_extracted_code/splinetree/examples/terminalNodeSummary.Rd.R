library(splinetree)


### Name: terminalNodeSummary
### Title: Prints a summary of a terminal node in a tree
### Aliases: terminalNodeSummary

### ** Examples

## No test: 
split_formula <- ~HISP + WHITE + BLACK + SEX + Num_sibs + HGC_FATHER + HGC_MOTHER
tree <- splineTree(split_formula, BMI~AGE, idvar = "ID",
   data = nlsySample, degree = 1, df = 3,
   intercept = TRUE, cp = 0.005)
## End(No test)
terminalNodeSummary(tree)



