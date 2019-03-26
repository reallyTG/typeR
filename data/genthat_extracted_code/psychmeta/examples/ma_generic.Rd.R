library(psychmeta)


### Name: ma_generic
### Title: Bare-bones meta-analysis of generic effect sizes
### Aliases: ma_generic

### ** Examples

es <- c(.3, .5, .8)
n <- c(100, 200, 150)
var_e <- 1 / n
ma_obj <- ma_generic(es = es, n = n, var_e = var_e)
ma_obj
summary(ma_obj)



