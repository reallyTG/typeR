library(PResiduals)


### Name: conditional_Spearman
### Title: Conditional Partial Spearman's Rank Correlation
### Aliases: conditional_Spearman

### ** Examples

data(PResidData)
library(rms)
#### fitting cumulative link models for both Y and W
result <- conditional_Spearman(c|y~ x + w, conditional.by="w",
                                       conditional.method="lm", conditional.formula="~rcs(w)",
                                       fit.x="poisson",fit.y="orm",
                                       data=PResidData, fisher=TRUE)
plot(result)



