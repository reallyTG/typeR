library(assist)


### Name: anova.ssr
### Title: Testing a Non-parametric Function Fitted via Smoothing Splines
### Aliases: anova.ssr
### Keywords: file

### ** Examples

data(acid)

# fit a partial thin-plate spline
temp <- ssr(ph~t1+x1+x2, rk=tp(t1), data=acid, spar="m")
anova(temp, 500)



