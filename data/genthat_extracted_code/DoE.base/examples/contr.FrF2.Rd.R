library(DoE.base)


### Name: contr.FrF2
### Title: Contrasts for orthogonal Fractional Factorial 2-level designs
### Aliases: contr.FrF2
### Keywords: array design

### ** Examples

## assign contr.FrF2 contrasts to a factor
status <- as.factor(rep(c("current","new"),4))
contrasts(status) <- contr.FrF2(2)
contrasts(status)



