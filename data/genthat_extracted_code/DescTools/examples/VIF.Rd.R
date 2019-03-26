library(DescTools)


### Name: VIF
### Title: Variance Inflation Factors
### Aliases: VIF
### Keywords: regression

### ** Examples

VIF(lm(Fertility ~ Agriculture + Education, data=swiss))
VIF(lm(Fertility ~ ., data=swiss))



