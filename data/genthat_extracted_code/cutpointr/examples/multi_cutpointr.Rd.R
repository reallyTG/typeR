library(cutpointr)


### Name: multi_cutpointr
### Title: Calculate optimal cutpoints and further statistics for multiple
###   predictors
### Aliases: multi_cutpointr

### ** Examples

library(cutpointr)

multi_cutpointr(suicide, x = c("age", "dsi"), class = "suicide",
                pos_class = "yes")

multi_cutpointr(suicide, x = c("age", "dsi"), class = "suicide",
                subgroup = "gender", pos_class = "yes")




