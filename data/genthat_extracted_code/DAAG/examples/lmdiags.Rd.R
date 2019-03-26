library(DAAG)


### Name: lmdiags
### Title: Return data required for diagnostic plots
### Aliases: lmdiags
### Keywords: regression

### ** Examples

women.lm <- lm(weight ~ height, data=women)
veclist <- lmdiags(x=women.lm)
## Returns the statistics that are required for graphs 1, 2, 3, and 5



