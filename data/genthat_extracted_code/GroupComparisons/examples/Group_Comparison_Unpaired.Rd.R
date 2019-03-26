library(GroupComparisons)


### Name: Group_Comparison_Unpaired
### Title: Unpaired Parametric/Non-Parametric Group Comparisons
### Aliases: Group_Comparison_Unpaired

### ** Examples

dt <- mtcars
vector1 <- dt$mpg
vector2 <- dt$hp
Group_Test <- Group_Comparison_Unpaired(vector1, vector2)
Group_Test



