library(plotfunctions)


### Name: sortBoxplot
### Title: Produce box-and-whisker plot(s) ordered by function such as mean
###   or median.
### Aliases: sortBoxplot

### ** Examples

head(ToothGrowth)
# sort on basis of mean length:
sortBoxplot(len ~ dose:supp, data = ToothGrowth)
# sort on basis of median length:
sortBoxplot(len ~ dose:supp, data = ToothGrowth, decreasing=FALSE)
# on the basis of variation (sd):
sortBoxplot(len ~ dose:supp, data = ToothGrowth, FUN='sd', col=alpha(2))



