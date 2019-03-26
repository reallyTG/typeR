library(CCM)


### Name: cor.by.class
### Title: Finds within class correlations
### Aliases: cor.by.class

### ** Examples

data(data.expr)
data(data.gender)
K = cor.by.class(data.expr, data.gender)
## visualize the results ##
boxplot(K, xlab = "gender")



