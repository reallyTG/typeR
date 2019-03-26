library(cutpointr)


### Name: cutpointr_
### Title: The standard evaluation version of cutpointr
### Aliases: cutpointr_

### ** Examples

library(cutpointr)

## Optimal cutpoint for dsi
data(suicide)
opt_cut <- cutpointr_(suicide, "dsi", "suicide")
opt_cut
summary(opt_cut)
plot(opt_cut)
predict(opt_cut, newdata = data.frame(dsi = 0:5))



