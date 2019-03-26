library(metaBMA)


### Name: plot_forest
### Title: Forest Plot for Meta-Analysis
### Aliases: plot_forest

### ** Examples

data(towels)
mf <- meta_fixed(towels$logOR, towels$SE, towels$study)
plot_forest(mf, mar = c(4.5,20,4,.2), xlab="Log Odds Ratio")



