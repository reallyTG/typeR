library(gratia)


### Name: is_offset
### Title: Is a model term an offset?
### Aliases: is_offset

### ** Examples

library("mgcv")
df <- gamSim(1, n = 400, dist = "normal")
m <- gam(y ~ s(x0) + s(x1) + offset(x0), data = df, method = "REML")
nm <- names(model.frame(m))
nm
is_offset(nm)



