library(fence)


### Name: fence.lmer
### Title: Fence model selection (Linear Mixed Model)
### Aliases: fence.lmer

### ** Examples

require(fence)
library(snow)

#### Example 1 #####
data(iris)
full = Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width + (1|Species)
# Takes greater than 5 seconds to run
# test_af = fence.lmer(full, iris)
# test_af$c
# test_naf = fence.lmer(full, iris, fence = "nonadaptive", cn = 12)
# plot(test_af)
# test_af$sel_model
# test_naf$sel_model



