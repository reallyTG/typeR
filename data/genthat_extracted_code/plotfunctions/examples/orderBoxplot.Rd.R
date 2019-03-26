library(plotfunctions)


### Name: orderBoxplot
### Title: Order boxplot stats following a given ordering.
### Aliases: orderBoxplot

### ** Examples

head(ToothGrowth)
# sort on basis of mean length:
bp <- boxplot(len ~ dose:supp, data = ToothGrowth, plot=FALSE)
idx <- sortGroups(len ~ dose:supp, data = ToothGrowth)
bp2 <- orderBoxplot(bp, idx)
# compare:
bp$names
bp2$names



