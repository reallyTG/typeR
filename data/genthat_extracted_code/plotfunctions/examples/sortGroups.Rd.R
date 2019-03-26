library(plotfunctions)


### Name: sortGroups
### Title: Sort groups based on a function such as mean value or deviation.
### Aliases: sortGroups

### ** Examples

head(ToothGrowth)
# sort on basis of mean length:
sortGroups(len ~ dose:supp, data = ToothGrowth)
labels = levels(interaction(ToothGrowth$dose, ToothGrowth$supp))
labels[sortGroups(len ~ dose:supp, data = ToothGrowth)]



