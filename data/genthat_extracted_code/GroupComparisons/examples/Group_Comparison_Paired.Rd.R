library(GroupComparisons)


### Name: Group_Comparison_Paired
### Title: Paired Parametric/Non-Parametric Group Comparisons
### Aliases: Group_Comparison_Paired

### ** Examples

dt <- mtcars
vector1 <- dt$mpg
vector2 <- dt$hp
Group_Test <- Group_Comparison_Paired(vector1, vector2)
Group_Test



