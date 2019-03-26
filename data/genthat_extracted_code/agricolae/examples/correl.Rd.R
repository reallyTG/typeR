library(agricolae)


### Name: correl
### Title: Correlation Coefficient
### Aliases: correl
### Keywords: multivariate

### ** Examples

library(agricolae)
data(soil)
with(soil,correl(pH,clay,method="kendall"))
with(soil,correl(pH,clay,method="spearman"))
with(soil,correl(pH,clay,method="pearson"))



