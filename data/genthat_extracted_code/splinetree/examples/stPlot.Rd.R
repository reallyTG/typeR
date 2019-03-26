library(splinetree)


### Name: stPlot
### Title: Plots a splinetree.
### Aliases: stPlot

### ** Examples

## No test: 
split_formula <- ~HISP + WHITE + BLACK + SEX + Num_sibs + HGC_FATHER + HGC_MOTHER
tree <- splineTree(split_formula, BMI~AGE, idvar = "ID",
   data = nlsySample, degree = 1, df = 3,
   intercept = TRUE, cp = 0.005)
## End(No test)
stPlot(tree, colors = c("red", "orange", "green", "blue", "cyan", "magenta"))



