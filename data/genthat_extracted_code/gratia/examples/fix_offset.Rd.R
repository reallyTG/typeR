library(gratia)


### Name: fix_offset
### Title: Fix the names of a data frame containing an offset variable.
### Aliases: fix_offset

### ** Examples

library("mgcv")
## Don't show: 
set.seed(2)
## End(Don't show)
df <- gamSim(1, n = 400, dist = "normal")
m <- gam(y ~ s(x0) + s(x1) + offset(x2), data = df, method = "REML")
names(model.frame(m))
names(fix_offset(m, model.frame(m), offset_val = 1L))



