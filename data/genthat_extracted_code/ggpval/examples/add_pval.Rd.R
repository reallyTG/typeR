library(ggpval)


### Name: add_pval
### Title: Add p-values to ggplot objects.
### Aliases: add_pval

### ** Examples

library(ggplot2)
library(ggpval)
data("PlantGrowth")
plt <- ggplot(PlantGrowth, aes(group, weight)) +
  geom_boxplot()
add_pval(plt, pairs = list(c(1, 3)), test='wilcox.test')





